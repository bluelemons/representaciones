class AddVersionateMonedas < ActiveRecord::Migration

  def self.up
    create_table :moneda_versions
  end

  def self.down
    drop_table :moneda_versions
  end

end

