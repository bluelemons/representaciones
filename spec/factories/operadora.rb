# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :operadora do
    name      { Forgery(:name).company_name }
    calle     "MyString"
    cuit 1
    telefono "MyString"
    legajo "MyString"
    email "email@email.com"
    web "www.myweb.com"
    localidad_id 4
  end
end

