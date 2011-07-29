class AddComisionTarifa < ActiveRecord::Migration
  def self.up
    add_column :reservas, :comision, :integer
    add_column :reserva_versions, :comision, :integer
    add_column :reservas, :habitaciones, :integer
    add_column :reserva_versions, :habitaciones, :integer

  end

  def self.down
    remove_column :reservas, :comision
    remove_column :reservas, :habitaciones
    remove_column :reserva_versions, :comision
    remove_column :reserva_versions, :habitaciones
  end
end
