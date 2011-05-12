class Cuenta < ActiveRecord::Base

  # clases
  # asociaciones
  belongs_to :entidad
  belongs_to :operadora, :class_name => "Entidad", :foreign_key => "operadora_id"
  monetize   :monto

  # validacioness
  validates_presence_of :entidad, :monto_cents, :monto_currency

  # scopes
  default_scope :include => [:entidad, :operadora]

  # metodos

end

