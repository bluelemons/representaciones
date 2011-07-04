class AddObservacionToPagos < ActiveRecord::Migration
  def self.up
    add_column :movimientos, :observaciones, :string
  end

  def self.down
    remove_column :movimientos, :observaciones
  end
end

