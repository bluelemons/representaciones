class AddVersionateAgencias < ActiveRecord::Migration

  def self.up
    Agencia.create_versioned_table
  end

  def self.down
    drop_table :agencia_versions
  end
  
end
