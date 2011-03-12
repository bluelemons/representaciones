# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :saldo do |f|
  f.entidad_id nil
  f.association :monto
  f.operadora_id nil
end

