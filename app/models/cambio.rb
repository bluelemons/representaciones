class Cambio < Movimiento

  validates :cuenta, :presence => true
  validates :monto, :presence => true

  after_save :withdraw
  before_save :deposit

  validate :existe_cotizacion
  validate :saldo_suficiente

  def rate
    c = cotizacion
    if c
      Money.add_rate(monto.currency,cuenta.monto.currency,c.compra)
      Money.add_rate(cuenta.monto.currency,monto.currency,1/c.compra)
    end
  end

  #convierte todo lo que halla en la cuenta a la moneda del monto
  def convertir_todo_a(m=cuenta.monto)
     c = cotizacion
     Money.add_rate(m.currency,monto.currency,1/c.compra)
     m.exchange_to(monto.currency)
  end

  # valida que exista plata en la cuenta.
  def saldo_suficiente
    if (cuenta && rate && (cuenta.monto < monto))
       errors.add(:base, "Debe tener suficiente dinero para efectuar el cambio")
    end
  end

  def cotizacion
    if fecha and monto and cuenta
      c = Cotizacion.buscar(fecha,cuenta.monto,monto).first
    end
  end

  #valida que existe la cotizacion para el día exista.
  def existe_cotizacion
    monto(true)
    if !cotizacion
      errors.add(:base, "No se cargo la cotizacion para esta transaccion")
    end
  end

  #retiro de la cuenta el monto que voy a cambiar
  def withdraw
    #>>  Money.add_rate("USD","ARS",4.1)
    #=> 4.1
    #>> Money.new(100,"USD").exchange_to("ARS")
    #=> #<Money cents:410 currency:ARS>
    cuenta.entidad.withdraw(monto.exchange_to(cuenta.monto.currency))
  end

  #deposito el monto nuevo.
  def deposit
    cuenta.entidad.deposit(monto)
  end

  def cuenta_objetivo
    entidad.cuenta(monto.currency,operadora)
  end
end

