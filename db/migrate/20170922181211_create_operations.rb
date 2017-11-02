class CreateOperations < ActiveRecord::Migration
  def self.up
    create_table :operations do |t|
      t.date :date
      t.string :type
      t.integer :user_id

      t.timestamps
    end

    add_index :operations, :date
    add_index :operations, :type
    add_index :operations, :user_id

    add_column :movimientos, :operation_id, :integer
    add_index :movimientos, :operation_id
  end

  def self.down
    remove_column :movimientos, :operation_id
    drop_table :operations
  end
end
