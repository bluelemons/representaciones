class Deposito < Movimiento
  validates_presence_of :tdeposito, :numero

  # deposita el dinero en el saldo correspondiente una vez que el
  # deposito fue registrado.
  after_save :depositar
  def depositar
    entidad.deposit(monto)
  end
end

