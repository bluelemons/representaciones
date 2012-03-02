class Moneda < ActiveRecord::Base
  #clases

  #asociaciones
  has_many :montos
  has_many :cotizacions

  #validacioness
  validates :name, :presence => true
  #scopes

  #metodos

end
