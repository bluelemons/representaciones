class Moneda < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  has_many :pagos
      
  #validacioness
  validates :name, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  
  #metodos
  
end
