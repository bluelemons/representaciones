class Reserva < ActiveRecord::Base
  # asociaciones
  belongs_to :thabitacion
  belongs_to :programa
  belongs_to :monto
  belongs_to :operadora, :class_name => "Entidad", :foreign_key => "operadora_id"
  belongs_to :agencia, :class_name => "Entidad",:foreign_key=>'agencia_id'
  has_many :movimientos
  has_and_belongs_to_many :pasajeros
end

