class Entidad < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :localidad
  belongs_to :tentidad  
  #validaciones
  
  #validates :calle, :presence => true
  #validates :cuit, :presence => true
  #validates :telefono, :presence => true
  #validates :legajo, :presence => true
  #validates :email, :presence => true
  #validates :web, :presence => true
  validates :localidad_id, :presence => true
  validates :name, :presence => true
  validates :tentidad_id, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  scope :agencia, where(:tentidad_id=>1)
  scope :operadora, where(:tentidad_id=>2)      
  #metodos
  
end
