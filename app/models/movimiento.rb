class Movimiento < ActiveRecord::Base
  #clases

  # Asociaciones
  belongs_to :user #es el usuario que lo crea o modifica
  belongs_to :reserva
  belongs_to :entidad
  belongs_to :operadora
  belongs_to :cuenta
  monetize   :monto

  # Validaciones
  validates :fecha, :presence => true
  validates :entidad, :presence => true
  validates :monto_cents, :presence => true
  validates :monto_currency, :presence => true
  validates :reserva, :presence => true
  validates :cuenta, :presence => true

  # scopes
  default_scope :include => [:reserva, :cuenta], :order => "id desc"
  scope :baja, where(:hidden=>0)
  # metodos
end

