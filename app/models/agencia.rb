class Agencia < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :direccion  
  has_many :reservas
  #validaciones
  validates :name, :presence => true
  #validates :direccion_id, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  
  #metodos
  
end
