class AddVersionateTentidads < ActiveRecord::Migration

  def self.up
    Tentidad.create_versioned_table
  end

  def self.down
    drop_table :tentidad_versions
  end
  
end
