class AddVersionateProgramas < ActiveRecord::Migration

  def self.up
    Programa.create_versioned_table
  end

  def self.down
    drop_table :programa_versions
  end
  
end
