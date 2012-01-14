# encoding: utf-8
require 'logger'

module Migrator

  class CotizacionFaltante < ActiveRecord::RecordNotFound
  end

  class DepositoDuplicado < StandardError
  end

  def self.migrate(real = false)
    migrator = Migrator::Base.new(real)
    migrator.start_migration
  end

  class Base

    #
    # setup the migration instance_variables
    #
    def initialize(real = false)
      @real = real
      @log = Logger.new("log/migration.log")
      @log.formatter = proc { |severity, datetime, progname, msg|
        "[%s %s] %s\n" % [ severity, datetime.strftime("%M:%S.%2N"), msg ]
      }
      @log.info "Starting logging"
      ActiveRecord::Base.logger = Logger.new("log/migration_database.log")
      @log.info "ActiveRecord login enabled"
      @depositos_exitosos_ids = []
      @depositos_sin_pagos = []
      @cambios_sin_cotizacion = []
      @depositos_con_errores = []
      @otros_errores = []
      @depositos_duplicados = []
    end

    #
    # Metodo principal que ordena el proceso de migración
    #
    def start_migration
      ActiveRecord::Base.transaction do
        # revisamos cada deposito y completamos los que están bien
        Deposito.where("reserva_id IS NOT NULL").find_each(:batch_size => 500) do |deposito|
          revisar_deposito deposito
        end

        # completamos los depositos_sin_pagos
        @depositos_sin_pagos.each do |deposito|
          completar_deposito_sin_pago(deposito)
        end

        log_resumen
        raise ActiveRecord::Rollback unless @real
      end

      File.open("log/migration.yml", "w") do |f|
        f.puts self.to_yaml
      end
    rescue
      binding.pry
    end

    private

    #
    # Revisa el deposito y lo completa si está completo, si tiene problemas los
    # regista para completarlos más adelante.
    #
    def revisar_deposito(deposito)
      case cambio_o_pago = Movimiento.find(deposito.id + 1)
      when Cambio
        pago = Movimiento.find(deposito.id + 2)
        raise "Incorrect kind" unless pago.kind_of?(Pago)
        cambio = cambio_o_pago
        monto_final = calcular_monto_final(deposito)
        completar_monto_final(deposito, monto_final)
      when Pago
        completar_monto_final(deposito, deposito.monto)
      else
        raise "Unexpected kind"
      end

    rescue ActiveRecord::RecordNotFound, RuntimeError
      report_error($!, deposito, :depositos_sin_pagos)
    end

    def calcular_monto_final(deposito)
      raise CotizacionFaltante unless cotizacion = Cotizacion.buscar(deposito.fecha, deposito.monto, deposito.reserva.total)
      cotizacion.add_rate
      deposito.monto.exchange_to(deposito.reserva.total.currency)
    rescue CotizacionFaltante
      report_error($!, deposito, :cambios_sin_cotizacion)
      Money.new(666, deposito.reserva.total.currency)
    end

    def completar_monto_final(deposito, monto_final)
      deposito.monto_final = monto_final
      deposito.save!
      @depositos_exitosos_ids << deposito.id
    rescue ActiveRecord::RecordInvalid
      report_error($!, deposito, :depositos_con_errores)
    end

    def completar_deposito_sin_pago(deposito)
      buscar_deposito_similar_a deposito

      total = deposito.reserva.total
      if total.currency != deposito.monto.currency
        monto_final = calcular_monto_final(deposito)
        completar_monto_final(deposito, monto_final)
      else
        completar_monto_final(deposito, deposito.monto)
      end
    rescue DepositoDuplicado
      report_error($!, deposito, :depositos_duplicados)
      deposito.delete
      @depositos_sin_pagos.delete(deposito)
    end

    def buscar_deposito_similar_a(deposito)
      similares_a = deposito.attributes.keep_if { |key, value|
        %w( entidad_id fecha monto_cents monto_currency numero reserva_id ).include?(key) }
      duplicados = Deposito.where("id != ?", deposito.id).where(similares_a)
      duplicados.each  do |duplicado|
        raise DepositoDuplicado, "El deposito sin pago: #{deposito.id} ha sido registrado repetidamente en el
      deposito duplicado: #{duplicado.id} que si tiene pago, así que es eliminado." if @depositos_exitosos_ids.include?(duplicado.id)
      end
    end

    # report the error in the log and save the deposito on the corresponding ivar.
    def report_error(error, deposito, type = :otros_errores)
      @log.error error.inspect
      @log.info deposito.inspect
      self.instance_variable_get("@#{type}") << deposito
      binding.pry if type == :otros_errores
    end

    def log_resumen
      @log.info "### RESUMEN ###"
      @log.info "Depositos completados exitosamente: #{@depositos_exitosos_ids.size}/#{Deposito.all.count}"
      @log.info "Depositos sin pagos: #{@depositos_sin_pagos.size}"
      @log.info "depositos duplicados eliminados: #{@depositos_duplicados.size}"
      @log.info "Depositos con errores: #{@depositos_con_errores.size}"
      @log.info "Cambios sin cotizacion: #{@cambios_sin_cotizacion.size}"
      @log.info "Depositos sin reserva_id: #{Deposito.where("reserva_id is null").count}"
      @log.info "Otros errores: #{@otros_errores.size}"
      %w[ cambios_sin_cotizacion depositos_con_errores depositos_sin_pagos ].each do |error|
        File.open("log/migration_#{error}.yaml", "w") do |f|
          f.puts self.instance_variable_get("@#{error}").to_yaml
        end
      end
    end

  end

end

