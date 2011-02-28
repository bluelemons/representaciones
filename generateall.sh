#!/bin/bash

# scaffolds

rails g scaffold reserva fecha:date salida:date activa:integer           \
  reservado:string hoteles:text periodo:integer regimen:string obs:text	   \
  thabitacion:references programa:references operadora:references	       \
  agencia:references operado:string iva:float impuesto:float seguro:float \
  monto:references  --no-migration
rails g scaffold pasajero doc:integer name:string nacimiento:date	       \
  tdoc:references --no-migration
rails g scaffold movimiento reserva:references entidad:references          \
  tpago:references tdeposito:references fecha:date monto:references
rails g scaffold entidad calle:string cuit:integer telefono:string 	       \
  legajo:string email:string web:string localidad:references name:string  \
  tentidad:references --no-migration
rails g scaffold cotizacion fecha:date compra:float moneda:references     \
  venta:float --no-migration

# solo el model
rails g model thabitacion name:string
rails g model tdoc name:string
rails g model localidad name:string postal:integer
rails g model tentidad name:string
rails g model tpago name:string
rails g model saldo entidad:references monto:references
rails g model tdeposito name:string
rails g model monto valor:float moneda:references
rails g model moneda name:string
rails g model programa name:string

# solo migration
rails g migration reserva_pasajero reserva:references pasajero:references

