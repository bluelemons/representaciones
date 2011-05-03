# -*- coding: utf-8 -*-
class Pago < Movimiento

  # validaciones:
  validates :reserva, :presence => true
  validates :monto, :presence => true
  #validates :saldo, :presence => true
  validate :validate_deuda
  validate :saldo_suficiente

  # Callbacks:

  before_save       :conversion
  after_validation  :pago_maximo

  # conversion realiza el exchange de dinero antes de el registro de
  # la transaccion.
  # Esta solo se realiza si las monedas en el saldo y en la reserva
  # son distintos.
  def conversion
    saldo_moneda = monto.moneda_id
    reserva_moneda = reserva.monto.moneda_id
    unless saldo_moneda == reserva_moneda
      convertido = Monto.new(:moneda_id => saldo_moneda,
                               :valor     => monto.to(saldo_moneda, fecha))
      monto = convertido
    end
  end

  # el pago no puede ser superior a la dueda.
  def pago_maximo
    tipo = entidad.type
    deuda = reserva.send((tipo.downcase + "_deuda").to_sym, :monto)
    if saldo
      entidad.withdraw(monto,saldo)
    end
    if monto.to(1, fecha) > deuda.to(1,fecha)
      m = monto
      resto = Monto.new(:valor=>monto.valor,:moneda=>monto.moneda)
      resto.valor = monto.valor - deuda.to(monto.moneda_id,fecha)
      m.valor = deuda.to(monto.moneda_id, fecha)

      #crea un deposito con el remanente
      depositar(resto)
    end
  end

  def depositar(m)
    deposito = Deposito.new(:monto =>m,:fecha=>fecha,:entidad=>entidad,:tdeposito =>tdeposito, :numero=>numero)
    deposito.save
  end

  # valida que exista la deuda.
  def validate_deuda
    tipo = entidad.type
    deuda = reserva.send((tipo.downcase + "_deuda").to_sym, :monto)
    unless (deuda.valor >0)
      errors.add(:base, "No exite deuda para saldar")
    end
  end

  # valida que exista plata en la cuenta.
  def saldo_suficiente
    if (saldo && (saldo.monto.to(1,fecha) < monto.to(1,fecha)))
       errors.add(:base, "Debe tener suficiente dinero para efectuar el pago")
    end
  end

  #scopes
end

