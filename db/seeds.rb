# coding: utf-8

#Pago.create({
#  :fecha=>"2011-01-30",
#  :reserva_id =>1,
#  :monto => 22.41,
#  :moneda_id =>1,
#  :entidad_id=>3,
#  :tpago_id=>1,
#  :numero =>123123
#})

puts Cotizacion.create([{
  :fecha =>'2011-01-01',
  :compra =>3.98,
  :venta =>4.00,
  :moneda_id =>2
  },{
  :fecha =>'2011-01-02',
  :compra =>3.99,
  :venta =>4.01,
  :moneda_id =>2
  },{
  :fecha =>'2011-01-03',
  :compra =>4.00,
  :venta =>4.02,
  :moneda_id =>2
  },{
  :fecha =>'2011-01-04',
  :compra =>4.01,
  :venta =>4.03,
  :moneda_id =>2
  }
])

puts Tpago.create([{
  :name =>'Deposito'
  },{
  :name =>'Pago'
  }
])

puts Tdeposito.create([{
  :name =>'Factura'
  },{
  :name =>'Banco'
  }
])
puts Tentidad.create([{
  :name =>'Agencia'
  },{
  :name =>'Operadora'
  }
])

puts Moneda.create([{
  :name =>'Pesos',
  :simbolo =>'$'
  },{
  :name =>'Dolares',
  :simbolo=>'u$s'
  },{
  :name =>'Euros',
  :simbolo=>'€'  
  }
])

puts Tdoc.create([{
  :name => 'DNI'
  },{
  :name => 'LE'
  },{
  :name => 'LC'
  }
])


puts Pasajero.create([{
  :doc=>28684242,
  :name =>"Oldani Pablo",
  :tdoc_id=>1,
  :nacimiento=>"1981-10-4"
  },{
  :doc=>31257560,
  :name =>"Dosso Liza",
  :tdoc_id=>1,
  :nacimiento=>"1984-10-15"
  },{
  :doc=>32454325,
  :name =>"Espinaco Eloy",
  :tdoc_id=>1,  
  :nacimiento=>"1985-06-14"
  }
])
puts Entidad.create([{
  :name =>"Daniel",
  :localidad_id=>4807,
  :calle=>'Saavedra 2854 dto 3',
  :tentidad_id=>2
  },{
  :name =>"Cristina",    
  :localidad_id=>4807,
  :calle=>'Crespo 3054 dpto 3',
  :tentidad_id=>2
  },{
  
  :name=>'Pirulo',  
  :cuit =>'23-28787872-9',
  :legajo=>'4d',
  :telefono=>'4584274',
  :email=>'pirulo@mail.com.ar',
  :web=>'http://pirulo.com.ar',
  :calle=>'Francia 2110',
  :localidad_id=>4807,
  :tentidad_id=>1
  },{
  :name=>'Mengano',
  :cuit =>'23-28783472-9',
  :legajo=>'3f',
  :telefono=>'4334274',
  :email=>'mengano@mail.com.ar',
  :web=>'http://mengano.com.ar',    
  :calle=>'Urquiza 1757 2b',
  :localidad_id=>3422,
  :tentidad_id=>1
  }

])


puts Programa.create([{
  :name => "Bariloche",
  :obs=>'Mucha joda a la noche'
  },{
  :name => "Brasil",
  :obs=>'Execelente para vacacionar con la familia'
  }
])

puts Thabitacion.create([{
  :name =>"Simple"
  },{
  :name =>"Doble"
  }])



puts Role.create({
  :name=>'Admin',
  :desc=>'Es el Rol de administrador'
})

puts User.create([{
  :username=>'olvap',
  :email=>'youre-mail@mail.com',
  :password_confirmation=>'admin6',
  :password=>'admin6',
  :role_ids=>[1]
  },{
  :username=>'eloy',
  :email=>'eloy-mail@mail.com',
  :password_confirmation=>'admin8',
  :password=>'admin8',
  :role_ids=>[1]
  }
])

puts Reserva.create(
  :hotel =>'Central Park',
  :reservado =>'Pablo',
  :regimen =>'All',
  :periodo => '6 Noches',
  :fecha => '2011-01-24',
  :salida=>'2011-03-21',
  :agencia_id=>3,
  :programa_id =>1,
  :operadora_id =>1,
  :thabitacion_id =>1,
  :pasajero_ids=>[1,2],
  :iva => 18.19,
  :impuesto =>20.01,
  :seguro => 0,
  :monto_attributes =>{
    :valor =>3500,
    :moneda_id =>1
    }
  )
  
  
puts Saldo.create([{
  :entidad_id=>1,
  :moneda_id=>1,
  :monto_attributes =>{
    :valor=>0,
    :moneda_id =>1
    }
  },{
  :entidad_id=>1,
  :moneda_id=>2,
  :monto_attributes =>{
    :valor=>0,
    :moneda_id =>2
    }
  },{
  :entidad_id=>1,
  :moneda_id=>3,
  :monto_attributes =>{
    :valor=>0,
    :moneda_id =>3
    }
  },{
  :entidad_id=>2,
  :moneda_id=>1,
  :monto_attributes =>{
    :valor=>0,
    :moneda_id =>1
    }
  },{
  :entidad_id=>2,
  :moneda_id=>2,
  :monto_attributes =>{
    :valor=>0,
    :moneda_id =>2
    }
  },{
  :entidad_id=>2,
  :moneda_id=>3,
  :monto_attributes =>{
    :valor=>0,
    :moneda_id =>3
    }
  },{
  :entidad_id=>3,
  :moneda_id=>1,
  :monto_attributes =>{
    :valor=>0,
    :moneda_id =>1
    }
  },{
  :entidad_id=>3,
  :moneda_id=>2,
  :monto_attributes =>{
    :valor=>0,
    :moneda_id =>2
    }
  },{
  :entidad_id=>3,
  :moneda_id=>3,
  :monto_attributes =>{
    :valor=>0,
    :moneda_id =>3
    }  
  }])
