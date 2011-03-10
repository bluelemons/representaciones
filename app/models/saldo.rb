class Saldo < ActiveRecord::Base
  #clases
  #asociaciones

  belongs_to :entidad
  belongs_to :moneda # TODO borrar esta linea
  belongs_to :monto, :dependent => :destroy

  accepts_nested_attributes_for :monto, :reject_if => lambda { |a| a[:valor].blank? }
  #validacioness
  validates :entidad_id, :presence => true
  #scopes

  #metodos

end

