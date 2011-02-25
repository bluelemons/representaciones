class Entidad < ActiveRecord::Base
  # asociaciones
  belongs_to :localidad
  belongs_to :tentidad
  has_many :saldos
  has_many :movimientos
end

