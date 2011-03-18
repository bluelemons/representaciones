class Pago < Movimiento

  # validaciones:
  validates_presence_of :reserva
  validate :saldo_suficiente
  validate :validate_deuda

  # valida que exista la deuda.
  def validate_deuda
    true
  end

  # valida que exista plata en la cuenta.
  def saldo_suficiente
    true
  end
  
  #scopes
  scope :baja, where(:hidden => 0)

end

