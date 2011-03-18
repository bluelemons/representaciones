class Deposito < Movimiento
  validates :tdeposito, :presence => true

  after_save :depositar
  def depositar
    entidad.deposit(monto)
  end

end

