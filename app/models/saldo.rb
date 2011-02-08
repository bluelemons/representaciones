class Saldo < ActiveRecord::Base
  #clases
  #asociaciones

  belongs_to :entidad
  belongs_to :moneda, :through => :monto
  belongs_to :monto
  
  accepts_nested_attributes_for :monto, :reject_if => lambda { |a| a[:valor].blank? }
  #validacioness
  validates :entidad, :presence => true
  #scopes
  
  #metodos
  
end  
