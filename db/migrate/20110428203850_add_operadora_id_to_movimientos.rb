class AddOperadoraIdToMovimientos < ActiveRecord::Migration
  def self.up
    add_column :movimientos, :operadora_id, :integer
    add_column :movimiento_versions, :operadora_id, :integer
  end

  def self.down
    remove_column :movimientos, :operadora_id
    remove_column :movimiento_versions, :operadora_id
  end
end

