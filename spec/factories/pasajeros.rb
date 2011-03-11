# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :pasajero do |f|
  f.doc 1
  f.name "MyString"
  f.nacimiento "2011-03-01"
  f.tdoc_id 1
end

