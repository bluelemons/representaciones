class CreatePermitions < ActiveRecord::Migration
  def self.up
    create_table :permitions,:id=>false do |t|
      t.integer :role_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :permitions
  end
end

