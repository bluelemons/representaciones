# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :operadora do |f|
  f.calle "MyString"
  f.cuit 1
  f.telefono "MyString"
  f.legajo "MyString"
  f.email "email@email.com"
  f.web "www.myweb.com"
  f.localidad_id 4
  f.name "MyString"
end

