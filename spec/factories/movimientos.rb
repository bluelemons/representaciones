# Read about factories at http://github.com/thoughtbot/factory_girl
require 'money'

FactoryGirl.define do
  factory :deposito do
    fecha             { Forgery(:date).date :max_delta => 3000 }
    association       :tdeposito
    sequence(:numero) {|n| n }
    association       :entidad
    monto             { Forgery(:monetary).money :max=>15000 }
  end

  factory :pago do
    fecha       { Forgery(:date).date :max_delta => 3000 }
    monto       { Forgery(:monetary).money :max=>15000 }
    association :entidad, :factory => :agency
    reserva     { |pago| Factory(:reserva, :agency => pago.entidad) }
    cuenta      { |pago| Factory(:cuenta, :monto => pago.monto, :entidad => pago.entidad) }
  end

  factory :cambio do
    fecha       { Forgery(:date).date :max_delta=>150, :past => true }
    monto       { Forgery(:monetary).money(:max=>1).to_money([:usd, :eur].sample) }
    association :entidad, :factory => :agency
    cuenta      { |c| Factory(:cuenta, :monto => Forgery(:monetary).money(:min=>5), :entidad => c.entidad) }

    factory :working_cambio do

      after_build do |c|
        Factory(:cotizacion, :fecha => c.fecha,
                :moneda_compra  => c.cuenta.monto.currency_as_string,
                :moneda_venta   => c.monto.currency_as_string,
                :compra         => 4)
      end
    end
  end
end

