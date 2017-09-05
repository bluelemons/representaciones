# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agency do
    name      { Forgery(:name).company_name }
    calle     "Albear 5234"
    telefono  "456-8791"
    legajo    "186324"
    email     "turismo@albear.com.ar"
    web       "www.myweb.com"
  end
end

