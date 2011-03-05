class Saldo < ActiveRecord::Base
  #clases
  #asociaciones

  belongs_to :entidad
  belongs_to :moneda
  belongs_to :monto,:dependent => :destroy

  accepts_nested_attributes_for :monto, :reject_if => lambda { |a| a[:valor].blank? }
  #validacioness
  validates :entidad, :presence => true
  #scopes

  #metodos

end

