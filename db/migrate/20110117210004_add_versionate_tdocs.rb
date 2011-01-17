class AddVersionateTdocs < ActiveRecord::Migration

  def self.up
    Tdoc.create_versioned_table
  end

  def self.down
    drop_table :tdoc_versions
  end
  
end
