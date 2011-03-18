class Movimiento < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :reserva
  belongs_to :entidad
  belongs_to :saldo
  belongs_to :monto

  belongs_to :tdeposito   #por banco o talonario, solo para depositos

  accepts_nested_attributes_for :monto, :reject_if => lambda { |a| a[:valor].blank? }
  #validaciones
  validates :fecha, :presence => true
  validates :entidad, :presence => true
  validates :monto, :presence => true

  #validates exista plata en la cuenta cuando es un pago
  #validates que la agencia tenga la reserva y que exista la deuda.

  #scopes
  #agrego por default montos, así por ejemplo podes hacer, pago.valor, en lugar de pago.monto.valor
  default_scope select("movimientos.*,montos.*").joins("left join montos on (montos.id = monto_id)")
  scope :baja, where(:hidden=>0)
  #metodos


end

