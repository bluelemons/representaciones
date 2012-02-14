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
    div(:id => "xtabs") do
      ul do
        li link_to "Detalles", "#xtabs-1"
        li link_to "Cuenta", "#xtabs-2"
        li link_to "Pagos", "#xtabs-3"
      end
      div(:id => "xtabs-1") do
        attributes_table_for entidad,
              :id, :name, :cuit, :calle, :localidad,
              :telefono, :email, :web
      end

      div(:id => "xtabs-2") do
        panel "Cuenta Corriente" do
          table_for entidad.cuentas do
            column :id
            column :monto
            column :operadora do |c| c.try(:operadora).try(:name) end
          end
        end
      end

      div(:id => "xtabs-3") do
        panel "Ultimos Pagos" do

          table_for entidad.pagos.limit 20 do
            column :fecha
            column :reserva
            column :monto
          end
        end
      end
    end
    active_admin_comments
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
