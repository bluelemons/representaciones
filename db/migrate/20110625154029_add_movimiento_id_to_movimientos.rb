class AddMovimientoIdToMovimientos < ActiveRecord::Migration
  def self.up
    add_column :movimientos, :movimiento_id, :integer
  end

  def self.down
    remove_column :movimientos, :movimiento_id
  end
end

