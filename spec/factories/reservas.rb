# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :reserva do |f|
  f.fecha "2011-03-01"
  f.salida "2011-03-01"
  f.reservado "MyString"
  f.hotel "MyText"
  f.periodo 1
  f.regimen "MyString"
  f.obs "MyText"
  f.association :thabitacion
  f.programa nil
  f.association :operadora, :factory => :entidad
  f.association :agencia, :factory => :entidad
  f.operado "MyString"
  f.iva 1.5
  f.impuesto 1.5
  f.seguro 1.5
  f.monto nil
end

