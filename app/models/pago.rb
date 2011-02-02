class Pago < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :reserva
  belongs_to :entidad
  belongs_to :moneda
  belongs_to :tpago
  belongs_to :tdeposito  
  
  #validaciones
  
  validates :entidad, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  scope :depositos,where(:tdeposito_id=>1)
  scope :pagos,where(:tdeposito_id=>2)
  #metodos
end
