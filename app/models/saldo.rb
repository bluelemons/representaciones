class Saldo < ActiveRecord::Base
  #clases
  #asociaciones

  belongs_to :entidad
  belongs_to :moneda
  #validacioness
  validates :entidad, :presence => true
  #scopes
  
  #metodos
  
end  
