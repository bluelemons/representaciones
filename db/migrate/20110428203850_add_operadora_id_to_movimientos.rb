class AddOperadoraIdToMovimientos < ActiveRecord::Migration
  def self.up
    add_column :movimientos, :operadora_id, :integer
  end

  def self.down
    remove_column :movimientos, :operadora_id
  end
end

