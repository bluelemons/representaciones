# coding: utf-8

['Recibo', 'Banco'].each do |tipo|
  Tdeposito.find_or_create_by_name tipo
end

[{ :name =>'Pesos', :simbolo =>'$'
  },{
  :name =>'Dolares', :simbolo=>'u$s'
  },{
  :name =>'Euros', :simbolo=>'€'
  }].each do |moneda|
  Moneda.find_or_create_by_name(moneda[:name], :simbolo => moneda[:simbolo])
end

['DNI', 'CUIT', 'CUIL', 'LE' ,'LC'].each do |tipo|
  Tdoc.find_or_create_by_name tipo
end

# Cargo los tipos de habitacion
%w( SGL DBL TPL CPL OTROS ).each do |hab|
  Thabitacion.find_or_create_by_name(hab)
end

puts Role.find_or_create_by_name('Admin',
  {:desc=>'Es el Rol de administrador'})

[{:username=>'olvap', :details => {
  :email=>'youre-mail@mail.com', :password_confirmation=>'admin6',
  :password=>'admin6' }},
  {:username=>'eloy', :details => {
  :email=>'eloy-mail@mail.com', :password_confirmation=>'admin8',
  :password=>'admin8' }},
  {:username=>'susana', :details => {
  :email=>'susana@gmail.com', :password_confirmation=>'susana1',
  :password=>'susana1' }}].each do |user_hash|
    user = User.find_or_create_by_username(user_hash[:username], user_hash[:details])
    user.roles = [Role.find_by_name("Admin")]
    user
end

require "#{RAILS_ROOT}/db/seeds/agencias/agencias"
require "#{RAILS_ROOT}/db/seeds/operadoras/operadoras"
require "#{RAILS_ROOT}/db/seeds/programas/programas"

