class Deposito < Movimiento
  # Validaciones
  validates_presence_of :tdeposito, :numero

  # Asociaciones
  monetize   :monto

  # deposita el dinero en el saldo correspondiente una vez que el
  # deposito fue registrado.
  after_save :depositar

  def depositar
    entidad.deposit(monto, operadora)
  end
end

