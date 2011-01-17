class Tarifa < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :reserva  
  has_and_belongs_to_many :pagos
  #validaciones
  
  #validates :iva, :presence => true
  #validates :impuesto, :presence => true
  #validates :monto, :presence => true
  #validates :comision, :presence => true
  #validates :efectivo, :presence => true
  #validates :anticipo, :presence => true
  #validates :comision, :presence => true
  #validates :obs, :presence => true
  #validates :reserva_id, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  
  #metodos
  
end
