class Pago < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :moneda  
  belongs_to :reserva
  belongs_to :tentidad
  belongs_to :tpago 
  #validaciones
  
  validates :fecha, :presence => true
  validates :monto, :presence => true
  validates :moneda, :presence => true
  validates :tentidad, :presence => true
  validates :tpago, :presence => true
  validates :numero, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  scope :pagencia, where(:tentidad_id=>1)   # pagos de la agencia
  scope :poperadora, where(:tentidad_id=>2) # pagos de la operadora
  
  #metodos
  def get_entidad
    if tentidad_id ==1
      reserva.try(:agencia)
    else
      reserva.try(:operadora)
    end
  end
  
end
