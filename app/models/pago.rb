class Pago < Movimiento

  # validaciones:
  #Esto es rails 2
  #validates_presence_of :reserva
  validates :reserva, :presence => true
  validates :saldo, :presence => true

  validate :validate_deuda
  validate :saldo_suficiente

  after_save :depositar
  after_save :pago_minimo
  after_save :convertir

  def pago_minimo
    # el pago no puede ser superior a la dueda.
  end

  def conventir
    # se fija si el saldo del cual se va a realizar la extracion es en la misma
    # moneda que la reservar.
    # si no, genera el cambio.
    # esta opcion solo ocurre cuando se selecciona el saldo y despues
    # de que se retiró de este.

    if (reserva.moneda != monto.moneda)
    #  monto.change(moneda_id)
    #  monto.save
    end
  end

  def depositar
    entidad.withdraw(monto,saldo)
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
    unless ( saldo.monto.valor >= monto.valor )
      errors.add(:base, "Debe tener suficiente dinero para efectuar el pago")
    end
  end

  #scopes

end

