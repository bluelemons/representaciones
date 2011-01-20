class Reserva < ActiveRecord::Base
  #clases
  acts_as_versioned
  #asociaciones
  belongs_to :user #es el usuario que lo crea o modifica

  belongs_to :thabitacion
  belongs_to :programa
  belongs_to :operadora
  belongs_to :agencia  
  has_and_belongs_to_many :pasajeros
  accepts_nested_attributes_for :pasajeros, :reject_if => lambda { |a| a[:name].blank? }  
  #validaciones
  
  #validates :fecha, :presence => true
  #validates :salida, :presence => true
  #validates :activa, :presence => true
  #validates :reservado, :presence => true
  #validates :hotel, :presence => true
  #validates :periodo, :presence => true
  #validates :regimen, :presence => true
  #validates :obs, :presence => true
  #validates :thabitacion_id, :presence => true
  #validates :programa_id, :presence => true
  #validates :operadora_id, :presence => true
  #validates :agencia_id, :presence => true
  #scopes
  scope :baja, where(:hidden=>0)
  
  #metodos
  
end
