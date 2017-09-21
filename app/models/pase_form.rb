class PaseForm
  attr_reader :pase, :reserva
  attr_accessor :monto, :origen_id, :destino_id, :cuentas_afectadas, :fecha

  def initialize reserva
    @reserva = reserva
    @pase = Pase.new
    asignar_reserva
    self.origen_id = reserva.id
  end

  def posibles_reservas
    @posibles_reservas ||= Reserva
      .where(agency_id: @reserva.agency_id, operadora_id: @reserva.operadora_id)
      .map { |reserva| [reserva, reserva.id, data_for(reserva)] }
  end

  def reservas_con_saldo
    @reservas_con_saldo ||= Reserva
      .where(agency_id: @reserva.agency_id, operadora_id: @reserva.operadora_id)
      .where('salida > ?', 6.months.ago)
      .includes(:depositos)
      .select { |reserva| tiene_saldo? reserva }
      .map { |reserva| [reserva, reserva.id, data_for(reserva)
   ] }
  end

  def persisted?
    false
  end

  private

  def tiene_saldo? reserva
    reserva.agencia_deuda.cents.negative? &&
      reserva.operadora_deuda.cents.negative?
  end

  def data_for reserva
    { 'data-currency': reserva.total_currency,
      'data-saldo': saldo(reserva) }
  end

  def saldo reserva
    [reserva.agencia_deuda,
     reserva.operadora_deuda].max.abs.to_d
  end

  def asignar_reserva
    if tiene_saldo? @reserva
      pase.origen_id = @reserva.id
      pase.monto = saldo(@reserva)
    else
      pase.destino = @reserva.id
    end
  end

end
