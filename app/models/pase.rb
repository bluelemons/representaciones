class Pase
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :monto, :origen_id, :destino_id, :cuentas_afectadas

  def initialize reserva
    @reserva = reserva
    self.origen_id = reserva.id
  end

  def posibles_reservas
    @posibles_reservas ||= Reserva
      .where(agency_id: @reserva.agency_id, operadora_id: @reserva.operadora_id)
      .map { |reserva| [reserva, reserva.id] }
  end

  def persisted?
    false
  end
end
