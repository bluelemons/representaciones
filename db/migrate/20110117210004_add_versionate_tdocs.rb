class AddVersionateTdocs < ActiveRecord::Migration

  def self.up
    create_table :tdoc_versions
  end

  def self.down
    drop_table :tdoc_versions
  end

end

