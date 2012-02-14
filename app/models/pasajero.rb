class Pasajero < ActiveRecord::Base
  #clases
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :tdoc

  has_many :viajeros
  has_many :reservas,:through => :viajeros
  #validaciones
  #validates :doc, :presence => true
  validates :name, :presence => true
  #validates :nacimiento, :presence => true
  #validates :tdoc_id, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)

  #metodos
end
