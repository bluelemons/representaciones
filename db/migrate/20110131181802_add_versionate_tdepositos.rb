class AddVersionateTdepositos < ActiveRecord::Migration

  def self.up
    create_table :tdeposito_versions
  end

  def self.down
    drop_table :tdeposito_versions
  end

end

