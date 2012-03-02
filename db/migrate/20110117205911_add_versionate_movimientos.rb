class AddVersionateMovimientos < ActiveRecord::Migration

  def self.up
    create_table :movimiento_versions
  end

  def self.down
    drop_table :movimiento_versions
  end

end

