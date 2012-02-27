class Moneda < ActiveRecord::Base
  #clases

  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  has_many :montos
  has_many :cotizacions

  #validacioness
  validates :name, :presence => true
  #scopes

  #metodos

end
