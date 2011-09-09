Factory.define :pago do |p|
  p.fecha       Date.today
  p.monto       { Forgery(:monetary).money :max=>15000 }
  p.association :entidad, :factory => :agency
  p.reserva     { |pago| Factory(:reserva, :agency => pago.entidad) }
  p.association :tdeposito
end
