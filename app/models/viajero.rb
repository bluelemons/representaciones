class Viajero < ActiveRecord::Base
  belongs_to :pasajero
  belongs_to :reserva
end

