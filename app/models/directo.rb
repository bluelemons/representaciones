class Directo < Movimiento
  validates_presence_of :tdeposito, :numero

  #genera el pago a la entidad
  def pago(entidad, cuenta)
    pago = Pago.new(:fecha=>fecha, :entidad=>entidad, :monto=>monto, :reserva=>reserva, :cuenta=>cuenta)
    pago.save
    pago
  end

end

