ActiveAdmin.register Entidad do
  menu :if => proc{ can?(:manage, Entidad) },:parent => "Comunes"

  scope :all, :default => true
  scope :agencias
  scope :operadoras

  filter :id
  filter :name
  filter :cuit

  index do
    column :id
    column :name
    column :cuit
    column :calle
    column :telefono
    column :email

    default_actions
  end

  show :title => :name do
    attributes_table_for entidad,
          :id, :name, :cuit, :calle, :localidad,
          :telefono, :email, :web
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :cuit
      f.input :legajo
      f.input :calle
      f.input :localidad
      f.input :telefono
      f.input :email
      f.input :web
   end

    f.buttons
  end
end
