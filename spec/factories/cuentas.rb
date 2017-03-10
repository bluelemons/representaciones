# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cuenta do
    association     :entidad
    monto           { Forgery(:monetary).money :max=>15000 }
  end
end

