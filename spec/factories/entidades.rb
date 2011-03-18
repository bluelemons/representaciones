# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :entidad do |f|
  f.calle "Aldao 3157"
  f.cuit 273067515479
  f.telefono "(0342) 457-71762"
  f.legajo ""
  f.email "empresa@email.com"
  f.web "www.excursiones.com"
  f.localidad_id 4
  f.name "excursiones"
end

