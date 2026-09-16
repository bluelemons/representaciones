class Cambio < Movimiento

  # M2b money: el port de money reelabora este modelo.
  #
  # validates :cuenta, :presence => true
  # before_create :withdraw
  # before_create :deposit
  # validate :existe_cotizacion?
  # validate :saldo_suficiente
  #
  # def rate
  #   if c = cotizacion
  #     c.add_rate
  #   end
  # end
  #
  # def convertir_todo_a(m=cuenta.monto)
  #    c = cotizacion
  #    Money.add_rate(m.currency,monto.currency,1/c.compra)
  #    m.exchange_to(monto.currency)
  # end
  #
  # def monto_original=(money)
  #   @monto_original = money
  # end
  #
  # def saldo_suficiente
  #   if (cuenta && rate && !alcanza_monto_de_la_cuenta?)
  #      errors.add(:base, "Debe tener suficiente dinero para efectuar el cambio")
  #   end
  # end
  #
  # def cuenta_objetivo
  #   entidad.cuenta(monto.currency,operadora)
  # end
  #
  # private
  #
  # def cotizacion
  #   if fecha and monto and cuenta
  #     Cotizacion.buscar(fecha,cuenta.monto,monto)
  #   end
  # end
  #
  # def existe_cotizacion?
  #   monto(true)
  #   if !cotizacion
  #     errors.add(:base, "No se cargo la cotizacion para esta transaccion")
  #   end
  # end
  #
  # def withdraw
  #   entidad.withdraw(@monto_original || monto.exchange_to(cuenta.monto.currency), operadora)
  # end
  #
  # def deposit
  #   entidad.deposit(monto, operadora)
  # end
  #
  # def deshacer
  #   rate &&
  #   entidad.withdraw(monto, operadora) &&
  #   entidad.deposit(monto.exchange_to(cuenta.monto.currency), operadora)
  # end
  #
  # def alcanza_monto_de_la_cuenta?
  #   (cuenta.monto - monto).cents >= -9
  # end
end