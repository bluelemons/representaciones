# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :deposito do |d|
  d.fecha             { Forgery(:date).date :max_delta => 3000 }
  d.association       :tdeposito
  d.sequence(:numero) {|n| n }
end

Factory.define :pago do |p|
  p.fecha       { Forgery(:date).date :max_delta => 3000 }
  p.monto       { Forgery(:monetary).money :max=>15000 }
  p.association :entidad, :factory => :agency
  p.reserva     { |pago| Factory(:reserva, :agency => pago.entidad) }
  p.cuenta      { |pago| Factory(:cuenta, :monto => pago.monto, :entidad => pago.entidad) }
end

