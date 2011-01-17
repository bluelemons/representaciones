class Direccion < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :localidad  
  #validaciones
  
  #validates :direccion, :presence => true
  #validates :cuit, :presence => true
  #validates :telefono, :presence => true
  #validates :legajo, :presence => true
  #validates :email, :presence => true
  #validates :web, :presence => true
  #validates :localidad_id, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  
  #metodos
  
end
