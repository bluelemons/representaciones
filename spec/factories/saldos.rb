# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :saldo do |f|
  f.association :entidad
  f.association :monto
  f.operadora_id nil
end

