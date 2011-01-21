# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed {or created alongside the db with db:setup}.
#
# Examples:
#
#   cities = City.create{[{ :name => 'Chicago' }, { :name => 'Copenhagen' }]}
#   Mayor.create{:name => 'Daley', :city => cities.first}
Tdoc.create{[{:name => 'DNI'}, {:name => 'LE'}, {:name => 'LC'}]}
Pasajero.create([{:doc=>28684242,:name =>"Oldani Pablo",:nacimiento=>"1981-10-4"},
 {:doc=>31257560,:name =>"Dosso Liza",:nacimiento=>"1984-10-15"},
 {:doc=>32454325,:name =>"Espinaco Eloy",:nacimiento=>"1985-06-14"}])
Agencia.create ([{:name=>'Pirulo'}, {:name=>'Mengano'}])
Programa.create ([{:name => "Bariloche"},{:name => "Brasil"}])
Thabitacion.create({:name =>"Simple"})
Thabitacion.create({:name =>"Doble"})
Operadora.create({:name =>"Daniel"})
Operadora.create({:name =>"Cristina"})
Role.create ({:name=>'Admin',:desc=>'Es el Rol de administrador'})
#Usuarios
User.create ({:username=>'olvap',:email=>'youre-mail@mail.com',:password_confirmation=>'admin6',:password=>'admin6', :role_ids=>[1]})
User.create ({:username=>'eloy',:email=>'eloy-mail@mail.com',:password_confirmation=>'admin8',:password=>'admin8', :role_ids=>[1]})
Site.create ({:name =>'Squeezer',:slogan=>'Porque a nadie le gusta exprimir pero a todos les gusta la limonada',:style=>'squeezer'})

