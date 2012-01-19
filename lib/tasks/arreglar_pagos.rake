# coding: utf-8

desc "arreglar_pagos"
task :arreglar_pagos => :environment do

  require 'logger'

  class DeletableRecord < StandardError
  end

  $counter = Hash.new(0)

  def fix_deposito(deposito, log)
    log.info "#====  INICIO REGISTRO ===="
    log.info "El deposito ##{deposito.id} tiene los siguientes errores: \n#{deposito.errors.to_yaml}"

    raise DeletableRecord, "Deposito sin reserva" unless deposito.reserva
    raise DeletableRecord, "Entidad-Reserva incoherente"  if deposito.errors[:base].include?("La entidad y la reserva no coinciden, vuelva a seleccionar la reserva")

    if deposito.monto.currency == deposito.reserva.total.currency and
        deposito.monto_final.zero?

      log.info "Se le carga el monto final a partir del inicial (misma moneda)"
      deposito.monto_final = deposito.monto
      $counter[:monto_misma_moneda] += 1
    end

    if deposito.monto_final.zero? and
        deposito.monto.currency != deposito.reserva.total.currency and
        deposito.fecha? and deposito.reserva and
        cotizacion = Cotizacion.buscar(deposito.fecha, deposito.monto, deposito.reserva.total)

      log.info "Se le carga el monto final a partir de la cotización a la fecha(misma moneda)"
      cotizacion.add_rate
      deposito.monto_final = deposito.monto.exchange_to(deposito.reserva.total.currency)
      $counter[:monto_distinta_moneda] += 1
    end

    unless deposito.fecha?
      log.info "Se le carga la fecha de carga como fecha de deposito"
      deposito.fecha = deposito.created_at
      $counter[:monto_fecha] += 1
    end

    if deposito.save
      log.info "El deposito pudo ser reparado correctamente"
      $counter[:deposito_exito] += 1
    else
      log.error "El deposito ##{deposito.id} no pudo ser reparado:\n #{deposito.errors.to_yaml}"
      $counter[:deposito_fallo] += 1
    end

  rescue DeletableRecord
    log.error "El deposito ##{deposito} tiene un problema (#{$!}) que no puede ser solucionado de manera automática y por lo tanto será eliminado"
    log.info "Entidad: #{deposito.entidad.try(:name)}"
    log.info "Reserva Op: #{deposito.reserva.try(:operadora).try(:name)}"
    log.info "Reserva Ag: #{deposito.reserva.try(:agency).try(:name)}"
    deposito.delete
    $counter[:deposito_eliminado] += 1

  ensure
    log.info "Pago:"
    log.info "  tipo_deposito: #{deposito.tdeposito.try(:name)}"
    log.info "  numero: #{deposito.numero}"
    log.info "  monto: #{deposito.format_monto}"
    log.info "  fecha: #{deposito.fecha}"
    log.info "  observaciones: #{deposito.observaciones}"
    log.info "  reserva:"
    log.info "    id: #{deposito.reserva.try(:id)}"
    log.info "    ref: #{deposito.reserva.try(:referencia)}"
    log.info "    ref: #{deposito.reserva.try(:total).try(:format)}"
    log.info "#====  FIN REGISTRO ====\n"
  end

  ActiveRecord::Base.transaction do
    begin
      file = File.open('log/pagos_arreglados.log', "a")
      log = Logger.new(file)

      Deposito.includes(:reserva).
               find_each do |deposito|
        fix_deposito(deposito, log) if deposito.invalid?
      end
    rescue
      log.error $!
      raise
    ensure
      log.info({"reserva" => $counter}.to_yaml)
      log.close
    end
  end

end

