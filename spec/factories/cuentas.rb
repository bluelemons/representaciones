# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :cuenta do |f|
  f.association     :entidad
  f.monto           { Forgery(:monetary).money :max=>15000 }
end

