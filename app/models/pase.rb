# Un pase retira saldo de una reserva y lo distribuye en otras reservas de la
# misma agencia y operadora.
#
# Un saldo positivo puede quedar remanente en una reserva debido a un
# sobre-pago o una devolución realizada por la operadora, la agencia luego
# mueve este saldo a otra reserva.
class Pase < Action
  attr_reader :source, :source_id, :destinations
  attr_accessor :debit, :entities

  before_create :move_money
  before_create :write_description

  def source_id= reserva_id
    @source_id = reserva_id
    @source = Reserva.find reserva_id
    @debit ||= saldo(source)
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

  def destinations= destinations
    @destinations = destinations
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

    #saco la plata de la reserva origen
    agencia = source.agencia
    operadora = source.operadora

    debitar = debit.to_money(source.total.currency) * -1

    if afecta_agencia?
      depositos.build fecha: date, entidad: agencia, reserva: source,
        monto: debitar, monto_final: debitar, tdeposito: tipo, numero: 0,
        observaciones: "Pase a #{ destination_details }"
      destinations.each do |reserva_id, amount|
        monto = amount.to_money(Reserva.find(reserva_id).total_currency)
        depositos.build fecha: date, entidad: agencia, reserva_id: reserva_id,
          monto: monto, monto_final: monto, tdeposito: tipo, numero: 0,
          observaciones: "Pase desde #{ source }"
      end
    end

    if afecta_operadora?
      depositos.build fecha: date, entidad: operadora, reserva: source,
        monto: debitar, monto_final: debitar, tdeposito: tipo, numero: 0,
        observaciones: "Pase a #{ destination_details }"
      destinations.each do |reserva_id, amount|
        monto = amount.to_money(Reserva.find(reserva_id).total_currency)
        depositos.build fecha: date, entidad: operadora, reserva_id: reserva_id,
          monto: monto, monto_final: monto, tdeposito: tipo, numero: 0,
          observaciones: "Pase desde #{ source }"
      end
    end
  end

  def afecta_agencia?
    ['agencia', 'ambas'].include? entities
  end

  def afecta_operadora?
    ['operadora', 'ambas'].include? entities
  end

  def destination_details
    destinations.map do |reserva_id, amount|
      "##{ reserva_id } ( #{ amount })"
    end.join("\n")
  end

  def write_description
    self.description = <<-DESC
Pase #{ date }
Desde #{ debit } #{ source.total_currency } desde #{ source }
A #{ destination_details }
DESC
  end
end
