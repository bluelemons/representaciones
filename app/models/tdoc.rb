class Tdoc < ActiveRecord::Base
  #clases

  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  has_many :pasajeros

  #validaciones
  validates :name, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)

  #metodos

end
