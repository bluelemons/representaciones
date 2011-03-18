# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :movimiento do |f|
  f.association :entidad, :factory => :agencia
  f.fecha "2011-01-05"
  f.association :monto
  f.association :saldo
end

Factory.define :deposito, :parent => :movimiento do |f|
end

Factory.define :pago, :parent => :movimiento do |f|
  f.association :reserva
end

