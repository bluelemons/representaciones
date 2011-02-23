#!/bin/bash

# scaffolds

rails g scaffold reserva fecha:date salida:date activa:integer           \
  reservado:string hoteles:text periodo:integer regimen:string obs:text	   \
  thabitacion_id:integer programa_id:integer operadora_id:integer	       \
  agencia_id:integer operado:string iva:float impuesto:float seguro:float \
  monto_id:integer
rails g scaffold pasajero doc:integer name:string nacimiento:date	       \
  tdoc_id:integer
rails g scaffold movimiento reserva_id:integer entidad_id:integer          \
  movimiento_id:integer tpago_id:integer tdeposito_id:integer fecha:date  \
  monto_id:integer
rails g scaffold entidad calle:string cuit:integer telefono:string 	       \
  legajo:string email:string web:string localidad_id:integer name:string  \
  tentidad_id:integer
rails g scaffold cotizacion fecha:date compra:float moneda_id:integer     \
  venta:float

# solo el model
rails g model thabitacion name:string
rails g model tdoc name:string
rails g model localidad name:string postal:integer
rails g model tentidad name:string
rails g model tpago name:string
rails g model saldo entidad_id:integer monto_id:integer
rails g model tdeposito name:string
rails g model monto valor:float moneda_id1:integer
rails g model moneda name:string
rails g model programa name:string

# solo migration
rails g migration reserva_pasajero reserva_id:integer pasajero_id:integer

