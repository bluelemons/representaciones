class Pago < Movimiento

  # validaciones:
  #Esto es rails 2
  #validates_presence_of :reserva
  validates :reserva, :presence => true
  validates :saldo, :presence => true

  validate :validate_deuda
  validate :saldo_suficiente

  after_save :depositar
  def depositar
    entidad.withdraw(monto)
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
    unless ( entidad.saldo(monto.moneda) >= monto.valor )
      errors.add(:base, "Debe tener suficiente dinero para efectuar el pago")
    end
  end

  #scopes

end

