class Programa < ActiveRecord::Base
  #clases

  #asociaciones
  has_many :reservas
  #validaciones
  validates :name, :presence => true
  #scopes

  #metodos

end
