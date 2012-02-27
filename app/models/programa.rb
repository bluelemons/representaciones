class Programa < ActiveRecord::Base
  #clases

  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  has_many :reservas
  #validaciones
  validates :name, :presence => true
  #scopes

  #metodos

end
