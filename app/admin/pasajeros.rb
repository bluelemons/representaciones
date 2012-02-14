ActiveAdmin.register Pasajero do
  menu :if => proc{ can?(:manage, Pasajero) },:parent => "Comunes"
end
