# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pasajero do |f|
    f.doc 35579156
    f.name "Alvaro, Carlos Roberto"
    f.nacimiento "1987-03-11"
    f.tdoc_id 1
  end
end

