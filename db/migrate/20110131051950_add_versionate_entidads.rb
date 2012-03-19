class AddVersionateEntidads < ActiveRecord::Migration

  def self.up
    create_table :entidad_versions
  end

  def self.down
    drop_table :entidad_versions
  end

end

