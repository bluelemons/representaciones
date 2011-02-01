class AddVersionateDepositos < ActiveRecord::Migration

  def self.up
    Deposito.create_versioned_table
  end

  def self.down
    drop_table :deposito_versions
  end
  
end
