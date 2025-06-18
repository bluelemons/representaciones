class AddIndexOnReservasSalida < ActiveRecord::Migration
  def self.up
    add_index :reservas, :salida
  end

  def self.down
    remove_index :reservas, :salida
  end
end
