# Un pase retira saldo de una reserva y lo distribuye en otras reservas de la
# misma agencia y operadora.
#
# Un saldo positivo puede quedar remanente en una reserva debido a un
# sobre-pago o una devolución realizada por la operadora, la agencia luego
# mueve este saldo a otra reserva.
class Transfer < Operation
  attr_reader :source, :source_id, :destinations
  attr_accessor :debit

  before_create :move_money

  validates_presence_of :date
  validates_presence_of :source

  def source_id= reserva_id
    @source_id = reserva_id
    @debit ||= saldo(source)
  end

  def source
    @source ||= Reserva.find source_id if source_id
  end

  def destinations_options
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

  def destinations= destinations
    @destinations = destinations.map do |id, amount|
      reserva = Reserva.find id
      [reserva, amount.to_money(reserva.total_currency)]
    end.to_h
  end

  # Una descripción del pase para enviar vía email
  def description
    header = "Pase #{ date }"
    @description ||= [header, *entries_details].join("\n")
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

  def move_money
    tipo = Tdeposito.where(name: 'Pase').first

    agencia = source.agencia
    operadora = source.operadora

    debitar = debit.to_money(source.total.currency) * -1

    [agencia, operadora].each do |entidad|
      depositos.build fecha: date, entidad: entidad, reserva: source,
        monto: debitar, monto_final: debitar, tdeposito: tipo, numero: 0,
        observaciones: "Pase a #{ destination_details }"
      destinations.each do |reserva, amount|
        depositos.build fecha: date, entidad: entidad, reserva: reserva,
          monto: amount, monto_final: amount, tdeposito: tipo, numero: 0,
          observaciones: "Pase desde #{ source }"
      end
    end
  end

  def destination_details
    destinations.map do |reserva, amount|
      format 'A: %s %10.2f %s', reserva, amount, amount.currency
    end.join("\n")
  end

  def entries_details
    depositos.select{ |e| e.entidad.type == "Agency" }.map do |entry|
      amount = entry.monto_final
      de_a = amount.cents < 0 ? 'De' : 'A'
      format '%2s: %-35s  | %10.2f %s', de_a, entry.reserva, amount, amount.currency
    end
  end
end
