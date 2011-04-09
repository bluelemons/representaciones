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

  #scopes
  #agrego por default montos, así por ejemplo podes hacer, pago.valor, en lugar de pago.monto.valor

  #default_scope select("movimientos.*,montos.moneda_id,montos.valor").joins(:monto)
  default_scope :include => [:monto,:reserva,:entidad,:saldo], :order => "id desc"
  scope :baja, where(:hidden=>0)
  #metodos
end

