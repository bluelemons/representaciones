class AddVersionateTarifas < ActiveRecord::Migration

  def self.up
    Tarifa.create_versioned_table
  end

  def self.down
    drop_table :tarifa_versions
  end
  
end
