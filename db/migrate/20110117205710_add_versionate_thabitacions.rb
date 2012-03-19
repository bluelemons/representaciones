class AddVersionateThabitacions < ActiveRecord::Migration

  def self.up
    create_table :thabitacion_versions
  end

  def self.down
    drop_table :thabitacion_versions
  end

end

