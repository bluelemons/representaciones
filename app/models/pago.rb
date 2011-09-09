# coding: utf-8
class Pago < ActiveRecord::Base

  belongs_to :entidad
  belongs_to :reserva
  belongs_to :tdeposito
  belongs_to :user

  validates_presence_of :reserva, :entidad, :tdeposito, :fecha
  validate  :coinciden_monedas


  # TODO: test this
  monetize   :monto
  monetize   :monto_original

  private

  # valida que las monedas coinciden.
  def coinciden_monedas
    unless reserva and reserva.total.currency == monto.currency
       errors.add(:monto, "Las monedas de la reserva y la cuenta no coinciden")
    end
  end

#  def _marcar_reserva_como_liquidada
#    reserva.actualizar_liquidadas
#  end

end
