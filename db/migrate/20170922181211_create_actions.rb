class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.date :date
      t.string :type
      t.text :description

      t.timestamps
    end

    add_index :actions, :date
    add_index :actions, :type

    add_column :movimientos, :action_id, :integer
    add_index :movimientos, :action_id
  end

  def self.down
    remove_column :movimientos, :action_id
    drop_table :actions
  end
end
