class Pago < Movimiento
#  #clases
#  acts_as_versioned
#  #asociaciones
#  belongs_to :user #es el usuario que lo crea o modifica
#  belongs_to :reserva
#  belongs_to :entidad
#  belongs_to :monto
#  belongs_to :tpago       #pago o deposito
#  belongs_to :tdeposito   #por banco o talonario
#
#  accepts_nested_attributes_for :monto, :reject_if => lambda { |a| a[:valor].blank? }
  #validaciones
  validates :saldo, :presence => true
  validate :checksaldo
  
#  validates :entidad, :presence => true
#  #validates exista plata en la cuenta cuando es un pago
#  #validates que la agencia tenga la reserva y que exista la deuda.
#
#  #scopes
#  scope :baja, where(:hidden=>0)
#  scope :depositos,where(:tpago_id=>1)
#  scope :pagos,where(:tpago_id=>2)
#  #metodos
end

