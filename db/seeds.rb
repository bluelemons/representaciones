# coding: utf-8

['Recibo', 'Banco'].each do |tipo|
  Tdeposito.find_or_create_by_name(tipo)
end

['DNI', 'CUIT', 'CUIL', 'LE' ,'LC'].each do |tipo|
  Tdoc.find_or_create_by_name tipo
end

# Cargo los tipos de habitacion
%w( SGL DBL TPL CPL OTROS ).each do |hab|
  Thabitacion.find_or_create_by_name(hab)
end

puts "Creando los roles"
puts Role.find_or_create_by_name('Admin',
  {:desc=>'Es el Rol de administrador'}).inspect
puts Role.find_or_create_by_name('Reservas',
  {:desc=>'Gestiona Reservas'}).inspect
puts Role.find_or_create_by_name('Tablas',
  {:desc=>'Gestiona Pagos y movimientos de dinero'}).inspect
puts Role.find_or_create_by_name('Pagos',
  {:desc=>'Gestiona las tablas del menu ABM'}).inspect

