class AddVersionatePasajeros < ActiveRecord::Migration

  def self.up
    Pasajero.create_versioned_table
  end

  def self.down
    drop_table :pasajero_versions
  end
  
end
