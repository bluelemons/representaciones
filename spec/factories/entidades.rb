# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :entidad do |f|
  f.calle "MyString"
  f.cuit 1
  f.telefono "MyString"
  f.legajo "MyString"
  f.email "MyString"
  f.web "MyString"
  f.localidad_id 4
  f.name "MyString"
  f.tentidad_id 1
end

Factory.define :agencia, :parent => :entidad do |f|
  f.tentidad_id 1
end

Factory.define :operadora, :parent => :entidad do |f|
  f.tentidad_id 2
end

