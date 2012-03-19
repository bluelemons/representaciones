class AddVersionateProgramas < ActiveRecord::Migration

  def self.up
    create_table :programa_versions
  end

  def self.down
    drop_table :programa_versions
  end

end

