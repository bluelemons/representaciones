class AddVersionateMonedas < ActiveRecord::Migration

  def self.up
    Moneda.create_versioned_table
  end

  def self.down
    drop_table :moneda_versions
  end
  
end
