class RemoveFechaFromReservas < ActiveRecord::Migration
  def self.up
    remove_column :reservas, :fecha
  end

  def self.down
    add_column :reservas, :fecha, :date
  end
end

