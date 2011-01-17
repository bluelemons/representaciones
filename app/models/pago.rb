class Pago < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :moneda  
  has_and_belongs_to_many :tarifas
  #validaciones
  
  validates :fecha, :presence => true
  validates :monto, :presence => true
  validates :moneda_id, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  
  #metodos
  
end
