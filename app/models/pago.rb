# -*- coding: utf-8 -*-
class Pago < Movimiento

  # validaciones:
  validates :reserva, :presence => true
  validates :saldo, :presence => true
  validate :validate_deuda
  validate :saldo_suficiente

  # Callbacks:

  before_validation :conversion
  after_save        :depositar
  after_save        :pago_minimo

  # conversion realiza el exchange de dinero antes de el registro de
  # la transaccion.
  # Esta solo se realiza si las monedas en el saldo y en la reserva
  # son distintos.

  def conversion
    saldo_moneda = saldo.monto.moneda_id
    reserva_moneda = reserva.monto.moneda_id
    unless saldo_moneda == reserva_moneda
      convertido = Monto.new(:moneda_id => saldo_moneda,
                             :valor => monto.to(saldo_moneda))
      monto = convertido
    end
  end

  def pago_minimo
    # el pago no puede ser superior a la dueda.
    # Esto debería llamarse pago maximo, ser una validacion y
    # verificar tambien que no sea superior al saldo.
  end

  def depositar
    entidad.withdraw(monto,saldo)
    if(entidad.type == "Agencia") #si es un pago de una agencia
      reserva.operadora.deposit(monto) #se aumenta el deposito de la operadora.
    end
  end

  # valida que exista la deuda.
  def validate_deuda
    true
  end

  # valida que exista plata en la cuenta.
  def saldo_suficiente
    unless ( saldo.monto.valor >= monto.valor )
      errors.add(:base, "Debe tener suficiente dinero para efectuar el pago")
    end
  end

  #scopes
end

