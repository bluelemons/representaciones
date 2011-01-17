class AddVersionateDireccions < ActiveRecord::Migration

  def self.up
    Direccion.create_versioned_table
  end

  def self.down
    drop_table :direccion_versions
  end
  
end
