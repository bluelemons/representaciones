# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :movimiento do |f|
  f.association :reserva
  f.association :entidad
  f.tdeposito nil
  f.fecha "2011-03-01"
  f.association :monto
end

Factory.define :deposito, :parent => :movimiento do |f|
end

Factory.define :pago, :parent => :movimiento do |f|
end

