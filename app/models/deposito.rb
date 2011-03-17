class Deposito < Movimiento
end
  #asociaciones
#  belongs_to :tdeposito   #por banco o talonario

  #  accepts_nested_attributes_for :monto, :reject_if => lambda { |a| a[:valor].blank? }
  #validaciones
 # validates :saldo, :presence => true


#  validates :entidad, :presence => true
#  #validates exista plata en la cuenta cuando es un pago
#  #validates que la agencia tenga la reserva y que exista la deuda.
#
#  #scopes
#  scope :baja, where(:hidden=>0)
#  scope :depositos,where(:tpago_id=>1)
#  scope :pagos,where(:tpago_id=>2)
#  #metodos

