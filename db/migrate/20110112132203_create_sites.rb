class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name
      t.string :slogan
      t.string :email
      t.text :mision
      t.text :footer
      t.string :style
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at
      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
