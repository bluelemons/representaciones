class Saldo < ActiveRecord::Base
  #clases
  #asociaciones

  belongs_to :entidad
  belongs_to :moneda #la moneda esta en el monto, ver el default_scope :)
  belongs_to :monto, :dependent => :destroy
  belongs_to :operadora, :class_name => "Entidad", :foreign_key => "operadora_id"

  accepts_nested_attributes_for :monto, :reject_if => lambda { |a| a[:valor].blank? }
  #validacioness
  validates :entidad, :presence => true
  validates :monto, :presence => true
  #scopes
  default_scope select("saldos.*,montos.moneda_id,montos.valor").joins(:monto)
  #ahora podes hacer saldo.moneda o saldo.valor y te devuelve saldo.monto.moneda o saldo.monto.valor segun corresponda

  scope :by_moneda_id, lambda { |moneda_id|
    where("montos.moneda_id =?", moneda_id)
  }
  scope :by_operadora_id, lambda { |operadora_id|
    where("operadora_id = ?",operadora_id)
  }

  #metodos
end

