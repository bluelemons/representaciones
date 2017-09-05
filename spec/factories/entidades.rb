# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entidad do
    calle "Aldao 3157"
    cuit 273067515479
    telefono "(0342) 457-71762"
    legajo ""
    email "empresa@email.com"
    web "www.excursiones.com"
    localidad_id 4
    name "excursiones"
  end
end

