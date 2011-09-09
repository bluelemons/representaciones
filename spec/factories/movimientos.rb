# Read about factories at http://github.com/thoughtbot/factory_girl
require 'money'

Factory.define :deposito do |d|
  d.fecha             { Forgery(:date).date :max_delta => 3000 }
  d.association       :tdeposito
  d.sequence(:numero) {|n| n }
  d.association       :entidad
  d.monto             { Forgery(:monetary).money :max=>15000 }
end

Factory.define :cambio do |c|
  c.fecha       { Forgery(:date).date :max_delta=>150, :past => true }
  c.monto       { Forgery(:monetary).money(:max=>1).to_money([:usd, :eur].sample) }
  c.association :entidad, :factory => :agency
  c.cuenta      { |c| Factory(:cuenta, :monto => Forgery(:monetary).money(:min=>5), :entidad => c.entidad) }
end

Factory.define :working_cambio, :parent => :cambio do |c|
  c.after_build do |c|
    Factory(:cotizacion, :fecha => c.fecha,
            :moneda_compra  => c.cuenta.monto.currency_as_string,
            :moneda_venta   => c.monto.currency_as_string,
            :compra         => 4)
  end
end

