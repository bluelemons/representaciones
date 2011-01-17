class AddVersionateOperadoras < ActiveRecord::Migration

  def self.up
    Operadora.create_versioned_table
  end

  def self.down
    drop_table :operadora_versions
  end
  
end
