class PaseForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_reader :pase
  attr_accessor :monto, :origen_id, :destino_id, :cuentas_afectadas, :fecha

  def initialize reserva
    @reserva = reserva
    @pase = Pase.new
    self.origen_id = reserva.id
  end

  def posibles_reservas
    @posibles_reservas ||= Reserva
      .where(agency_id: @reserva.agency_id, operadora_id: @reserva.operadora_id)
      .map { |reserva| [reserva, reserva.id] }
  end

  def reservas_con_saldo
    @reservas_con_saldo ||= Reserva
      .where(agency_id: @reserva.agency_id, operadora_id: @reserva.operadora_id)
      .where('salida > ?', 6.months.ago)
      .includes(:depositos)
      .select { |reserva| tiene_saldo? reserva }
      .map { |reserva| [reserva, reserva.id, { 'data-currency': reserva.total_currency }] }
  end

  def persisted?
    false
  end

  private

  def tiene_saldo? reserva
    reserva.agencia_deuda.cents.negative? ||
      reserva.operadora_deuda.cents.negative?
  end

end
