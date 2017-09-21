class PaseForm
  attr_reader :pase, :reserva
  attr_accessor :monto, :origen_id, :destino_id, :cuentas_afectadas, :fecha

  def initialize reserva
    @reserva = reserva
    @pase = Pase.new
    @pase.origen_id = reserva.id
    @pase.monto = saldo(reserva)
    self.origen_id = reserva.id
  end

  def posibles_reservas
    @posibles_reservas ||= Reserva
      .where(agency_id: @reserva.agency_id)
      .where(operadora_id: @reserva.operadora_id)
      .where('id <> ?', @reserva.id)
      .where('salida > ?', 10.months.ago)
      .reorder(:salida)
      .includes(:depositos)
      .map { |reserva| [reserva, reserva.id, data_for(reserva)] }
      .select { |option| option[2][:'data-debt'] > 0 }
  end

  private

  def data_for reserva
    { 'data-currency': reserva.total_currency,
      'data-debt': debt(reserva) }
  end

  def debt reserva
    [reserva.agencia_deuda,
     reserva.operadora_deuda].max.to_d
  end

  def saldo reserva
    [reserva.agencia_deuda,
     reserva.operadora_deuda].max.abs.to_d
  end

end
