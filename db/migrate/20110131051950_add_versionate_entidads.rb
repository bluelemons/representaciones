class AddVersionateEntidads < ActiveRecord::Migration

  def self.up
    Entidad.create_versioned_table
  end

  def self.down
    drop_table :entidad_versions
  end
  
end
