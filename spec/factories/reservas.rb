# encoding: utf-8

FactoryGirl.define do
  factory :reserva do
    # fecha       Forgery(:date).date
    # salida      Forgery(:date).date
    # reservado   Forgery(:name).first_name
    # operado     Forgery(:name).first_name
    # hotel       Forgery(:name).location
    # periodo     "#{rand(10)} noches"
    # regimen     "media_pensión"
    # association :thabitacion
    # association :programa
    # association :operadora
    # association :agency
    # iva         Forgery(:monetary).money
    # impuesto    Forgery(:monetary).money
    # seguro      Forgery(:monetary).money
    # total       Forgery(:monetary).money
  end
end
