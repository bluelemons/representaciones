class RemoveFechaFromReservas < ActiveRecord::Migration
  def self.up
    [:reservas].each do |table_name|
      remove_column table_name, :fecha
    end
  end

  def self.down
    [:reservas].each do |table_name|
      add_column table_name, :fecha, :date
    end
  end
end
