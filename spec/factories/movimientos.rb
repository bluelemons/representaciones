# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :movimiento do |f|
  f.association :entidad
  f.fecha "2011-01-05"
  f.association :monto
  f.association :cuenta
end

Factory.define :deposito, :parent => :movimiento do |f|
  f.association :tdeposito
end

Factory.define :pago do |f|
  f.fecha "2011-01-05"
  f.association :monto
end

