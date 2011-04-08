class Directo < Movimiento
  validates_presence_of :tdeposito, :numero

  #genera el pago a la entidad
  def pago(entidad,saldo)
    pago = Pago.new(:fecha=>fecha,:entidad=>entidad,:monto=>monto,:reserva=>reserva,:saldo=>saldo)
    pago.save
    pago
  end

end

