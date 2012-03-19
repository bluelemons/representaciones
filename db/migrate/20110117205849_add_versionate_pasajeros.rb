class AddVersionatePasajeros < ActiveRecord::Migration

  def self.up
    create_table :pasajero_versions
  end

  def self.down
    drop_table :pasajero_versions
  end

end

