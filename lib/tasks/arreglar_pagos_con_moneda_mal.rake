desc "arreglar_pagos_con_moneda_mal"
task :arreglar_pagos_con_moneda_mal => :environment do

  problemas = []

  depositos_problematicos = Deposito.includes(:reserva).where("movimientos.monto_final_currency != reservas.total_currency")
  depositos_problematicos.find_each do |deposito|
    if cotizacion = Cotizacion.buscar(deposito.fecha, deposito.monto, deposito.reserva.total)
      cotizacion.add_rate
      deposito.monto_final = deposito.monto.exchange_to(deposito.reserva.total.currency)
      deposito.save
    else
      problemas << deposito
      deposito.delete
    end
  end

  depositos_problematicos = Deposito.where('movimientos.fecha = "0000-00-00" ')
  depositos_problematicos.find_each do |deposito|
    deposito.fecha = deposito.created_at
    deposito.save
  end

  Deposito.unscoped.find_each do |d|
    problemas << d if d.invalid?
  end

  File.open "log/problemas.log", "a" do |f|
    problemas.each do |p|
      f.puts "Pago:"
      f.puts "  id: #{deposito.id}"
      f.puts "  tipo_deposito: #{deposito.tdeposito.name}"
      f.puts "  numero: #{deposito.numero}"
      f.puts "  monto: #{deposito.monto.format}"
      f.puts "  fecha: #{deposito.fecha}"
      f.puts "  observaciones: #{deposito.observaciones}"
      f.puts "  reserva:"
      f.puts "    id: #{deposito.reserva.id}"
      f.puts "    ref: #{deposito.reserva.referencia}"
      f.puts "\n #====  FIN REGISTRO ===="
    end
  end unless problemas.empty?

end

