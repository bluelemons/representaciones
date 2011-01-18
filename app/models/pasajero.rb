class Pasajero < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :tdoc  
  has_and_belongs_to_many :reservas
  #validaciones
  #validates :doc, :presence => true
  validates :name, :presence => true
  #validates :nacimiento, :presence => true
  #validates :tdoc_id, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
 
  #metodos
  
end
