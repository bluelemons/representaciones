ActiveAdmin.register Thabitacion do
  menu :if => proc{ can?(:manage, Thabitacion) },:parent => "Comunes"
end
