ActiveAdmin.register Programa do
  menu :if => proc{ can?(:manage, Programa) },:parent => "Comunes"
end
