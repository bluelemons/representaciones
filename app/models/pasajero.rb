class Pasajero < ActiveRecord::Base
  #clases

  #asociaciones
  belongs_to :tdoc

  has_many :viajeros
  has_many :reservas,:through => :viajeros
  #validaciones
  #validates :doc, :presence => true
  validates :name, :presence => true
  #validates :nacimiento, :presence => true
  #validates :tdoc_id, :presence => true
  #scopes

  #metodos
end
