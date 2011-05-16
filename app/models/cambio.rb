class Cambio < Movimiento
  validates :cuenta, :presence => true
  validates :monto, :presence => true

  before_save :withdraw
  before_save :deposit
  validate :saldo_suficiente
  validate :existe_cotizacion

  # valida que exista plata en la cuenta.
  def saldo_suficiente
    if (cuenta && (cuenta.monto < monto))
       errors.add(:base, "Debe tener suficiente dinero para efectuar el pago")
    end
  end

  #valida que existe la cotizacion para el día exista.
  def existe_cotizacion
    true
  end

  #retiro de la cuenta el monto que voy a cambiar
  def withdraw
    #>>  Money.add_rate("USD","ARS",4.1)
    #=> 4.1
    #>> Money.new(100,"USD").exchange_to("ARS")
    #=> #<Money cents:410 currency:ARS>
    #>> Money.new(100,"ARS").exchange_to("USD")
    cotizacion = 4.17
    Money.add_rate(cuenta.monto.currency,monto.currency,cotizacion)
    cuenta.entidad.withdraw(monto.exchange_to(cuenta.monto.currency))
  end

  #deposito el monto nuevo.
  def deposit
    cuenta.entidad.deposit(monto)
  end
end

