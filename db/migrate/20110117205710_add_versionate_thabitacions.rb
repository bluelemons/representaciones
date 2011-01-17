class AddVersionateThabitacions < ActiveRecord::Migration

  def self.up
    Thabitacion.create_versioned_table
  end

  def self.down
    drop_table :thabitacion_versions
  end
  
end
