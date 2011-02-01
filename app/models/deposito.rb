class Deposito < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :tpago
  belongs_to :entidad
  belongs_to :movimiento  
  accepts_nested_attributes_for :movimiento  
  #validaciones
  
  #validates :fecha, :presence => true
  #validates :monto, :presence => true
  #validates :moneda_id, :presence => true
  #validates :tdeposito_id, :presence => true
  #validates :direccion_id, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  
  #metodos
  
end
