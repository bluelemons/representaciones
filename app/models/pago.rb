# -*- coding: utf-8 -*-
class Pago < Movimiento

  # Callbacks
  before_create        :check_deuda, :sacar_la_plata
  after_save         :_marcar_reserva_como_liquidada

  validates :cuenta, :presence => true
  validates :reserva, :presence => true
  validates :monto, :presence => true
  validate  :saldo_suficiente, :on => :create
  validate  :coinciden_monedas, :on => :create

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

end