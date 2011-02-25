class Movimiento < ActiveRecord::Base
  #asociaciones
# belongs_to :user # El usuario que lo crea o modifica.
  belongs_to :reserva
  belongs_to :entidad
  belongs_to :monto
  belongs_to :tpago       #pago o deposito
  belongs_to :tdeposito   #por banco o talonario
end

