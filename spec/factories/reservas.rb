# Read about factories at http://github.com/thoughtbot/factory_girl
Factory.define :reserva do |f|
  f.fecha       Forgery(:date).date
  f.salida      Forgery(:date).date
  f.reservado   Forgery(:name).first_name
  f.operado     Forgery(:name).first_name
  f.hotel       Forgery(:name).location
  f.periodo     "#{rand(10)} noches"
  f.regimen     "media_pension"
  f.association :thabitacion
  f.association :programa
  f.association :operadora
  f.association :agency
  f.iva         Forgery(:monetary).money
  f.impuesto    Forgery(:monetary).money
  f.seguro      Forgery(:monetary).money
  f.total       Forgery(:monetary).money
end

