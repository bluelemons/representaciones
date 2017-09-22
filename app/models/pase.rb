class Pase < Action

  attr_reader :source, :source_id, :debit, :entities

  def source= reserva
    @debit = saldo(reserva)
    @source = reserva
  end

  def posibles_reservas
    raise unless source
    Reserva
      .where(agency_id: source.agency_id)
      .where(operadora_id: source.operadora_id)
      .where('id <> ?', source.id)
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
