class Tdoc < ActiveRecord::Base
  #clases

  #asociaciones
  has_many :pasajeros

  #validaciones
  validates :name, :presence => true

  #metodos

end

