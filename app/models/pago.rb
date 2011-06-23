# -*- coding: utf-8 -*-
class Pago < Movimiento

  # Callbacks
  before_save        :check_deuda, :sacar_la_plata
  after_save         :_marcar_reserva_como_liquidada

  validates :cuenta, :presence => true
  validates :reserva, :presence => true
  validates :monto, :presence => true
  validate  :saldo_suficiente
  validate  :coinciden_monedas

  # Asigna una cuenta a partir de la entidad y el monto si no tiene una asignada.
  before_validation do |p|
    if p.cuenta.nil? && p.entidad
      p.cuenta = p.entidad.cuenta(p.monto.currency, p.operadora)
    end
  end

  # valida que exista plata en la cuenta.
  def saldo_suficiente
    if same_currency? && cuenta.monto < monto
       errors.add(:base, "Debe tener suficiente dinero para efectuar el pago")
    end
  end

  # valida que las monedas coinciden.
  def coinciden_monedas
    unless same_currency?
       errors.add(:base, "Las monedas de la reserva y la cuenta no coinciden")
    end
  end

  private

  # Chequea la coincidencia de monedas
  def same_currency?
    same_currency_cuenta? && same_currency_reserva?
  end

  def same_currency_cuenta?
    cuenta.monto.currency == monto.currency if cuenta && monto
  end

  def same_currency_reserva?
    reserva.total.currency == monto.currency if reserva && monto
  end

  # devuelve el dinero a la cuenta
  def deshacer
    entidad.deposit monto, operadora
  end

  def check_deuda
    if entidad && reserva && monto
      deuda = reserva.send(entidad.type.downcase + "_deuda")
      self.monto = deuda if monto > deuda
    end
  end

  def sacar_la_plata
    entidad.withdraw(monto, operadora)
  end

  def _marcar_reserva_como_liquidada
    reserva.actualizar_liquidadas
  end

#  before_save       :conversion
#
#  # conversion realiza el exchange de dinero antes de el registro de
#  # la transaccion.
#  # Esta solo se realiza si las monedas en la cuenta y en la reserva
#  # son distintas.
#  def conversion
#    cuenta_moneda = monto.moneda_id
#    reserva_moneda = reserva.monto.moneda_id
#    unless cuenta_moneda == reserva_moneda
#      convertido = Monto.new(:moneda_id => cuenta_moneda,
#                             :valor     => monto.to(cuenta_moneda, fecha))
#      monto = convertido
#    end
#  end
#
#  # el pago no puede ser superior a la dueda.
#  def pago_maximo
#    tipo = entidad.type
#    deuda = reserva.send((tipo.downcase + "_deuda").to_sym, :monto)
#    if cuenta
#      entidad.withdraw(monto,cuenta)
#    end
#    if monto.to(1, fecha) > deuda.to(1,fecha)
#      m = monto
#      resto = Monto.new(:valor=>monto.valor,:moneda=>monto.moneda)
#      resto.valor = monto.valor - deuda.to(monto.moneda_id,fecha)
#      m.valor = deuda.to(monto.moneda_id, fecha)
#
#      #crea un deposito con el remanente
#      depositar(resto)
#    end
#  end
#
#  def depositar(m)
#    deposito = Deposito.new(:monto =>m,:fecha=>fecha,:entidad=>entidad,:tdeposito =>tdeposito, :numero=>numero)
#    deposito.save
#  end
#
#  # valida que exista la deuda.
#  def validate_deuda
#    tipo = entidad.type
#    deuda = reserva.send((tipo.downcase + "_deuda").to_sym, :monto)
#    unless (deuda.valor >0)
#      errors.add(:base, "No exite deuda para saldar")
#    end
#  end
#
#  # valida que exista plata en la cuenta.
#  def saldo_suficiente
#    if (cuenta && (cuenta.monto.to(1,fecha) < monto.to(1,fecha)))
#       errors.add(:base, "Debe tener suficiente dinero para efectuar el pago")
#    end
#  end
#
#  #scopes
end

