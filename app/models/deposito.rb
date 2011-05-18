class Deposito < Movimiento
  # Validaciones
  validates_presence_of :tdeposito, :numero

  # Asociaciones
  belongs_to :tdeposito
  monetize   :monto


  # deposita el dinero en la cuenta correspondiente una vez que el
  # deposito fue registrado.
  after_save :depositar

  def depositar
    entidad.deposit(monto, operadora)
  end
end

