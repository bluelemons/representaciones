class Monto < ActiveRecord::Base
  belongs_to :moneda
  has_many :pagos
  has_many :reservas
  has_many :cuentas

  default_scope { includes(:moneda) }

  # M2b money: #to_money usaba el gem Money y #to_pesos/#dolares/#pesos
  # dependian de Cotizacion.a_la_fecha que no existe (bug preexistente).
  # def to_money
  #   currency = case self.moneda.name
  #     when "Pesos"
  #       :ars
  #     when "Dolares"
  #       :usd
  #     when "Euros"
  #       :eur
  #   end
  #   Money.new((self.valor * 100).round, currency)
  # end
  #
  # def to_pesos(date)
  #   monto=valor
  #   if moneda_id >1
  #     monto *= Cotizacion.a_la_fecha(date,moneda_id).first.compra
  #   end
  #   monto
  # end
  #
  # def to(x, fecha)
  #   v = self.valor
  #   if moneda_id == x
  #     v
  #   else
  #     if(x == 2) #si se quiere convertir a dolares
  #       v = dolares(fecha)
  #     else
  #       v = pesos
  #     end
  #   end
  #   v
  # end
  #
  # def pesos()
  #   v = self.valor
  #   m = self.moneda_id
  #
  #   c = (Cotizacion.a_la_fecha("2011-01-01",m).first.try(:compra) || 1)
  #   v *= c
  #   v
  # end
  #
  # def dolares(fecha)
  #   v = self.valor
  #   m = self.moneda_id
  #
  #   c = (Cotizacion.a_la_fecha(fecha,2).first.try(:compra) || 1)
  #   v /= c
  #   v
  # end
  #
  # def e?(m2,fecha)
  #   (to_pesos(fecha) == m2.to_pesos(fecha))
  # end
  #
  # def gt?(m2,fecha)
  #   (to_pesos(fecha) > m2.to_pesos(fecha))
  # end
  #
  # def lt?(m2,fecha)
  #   (to_pesos(fecha) < m2.to_pesos(fecha))
  # end
  #
  # def gte?(m2,fecha)
  #   (to_pesos(fecha) >= m2_to_pesos(fecha))
  # end
  #
  # def lte?(m2,fecha)
  #   (to_pesos(fecha) <= m2.to_pesos(fecha))
  # end
end