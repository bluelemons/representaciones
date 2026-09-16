class Tdeposito < ActiveRecord::Base
  #clases
  # TODO: M4/M2b port of acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  
      
  #validaciones
  
  #validates :name, :presence => true
  #scopes
  scope :baja, -> { where(hidden: 0) }
  
  #metodos
  
end
