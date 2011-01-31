class AddVersionateTpagos < ActiveRecord::Migration

  def self.up
    Tpago.create_versioned_table
  end

  def self.down
    drop_table :tpago_versions
  end
  
end
