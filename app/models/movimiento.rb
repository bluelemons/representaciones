class Movimiento < ActiveRecord::Base
  #clases
  #asociaciones
  belongs_to :moneda #es el usuario que lo crea o modifica
  belongs_to :tpago
      
  #validacioness
  validates :fecha, :presence => true
  validates :monto, :presence => true  
  #validates :moneda, :presence => true
  #scopes
  
  #metodos
  
end
