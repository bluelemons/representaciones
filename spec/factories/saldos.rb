# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :saldo do |f|
  f.association     :entidad
  f.monto           Money.new(rand(600000), [:ARS,:USD,:EUR][rand(3)])
end

