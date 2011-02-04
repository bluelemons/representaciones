class AddVersionatePagos < ActiveRecord::Migration

  def self.up
    Movimiento.create_versioned_table
  end

  def self.down
    drop_table :movimiento_versions
  end
  
end
