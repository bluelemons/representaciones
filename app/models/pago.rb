class Pago < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :reserva
  belongs_to :entidad
  belongs_to :movimiento
  accepts_nested_attributes_for :movimiento
  
  #validaciones
  
  validates :entidad, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
    
  #metodos
end
