class CreateOperaciones < ActiveRecord::Migration
  def self.up
    create_table :operaciones do |t|
      t.date :fecha
      t.string :type
      t.text :observaciones
      t.belongs_to :user

      t.timestamps
    end

    add_index :operaciones, :fecha
    add_index :operaciones, :type
  end

  def self.down
    drop_table :operaciones
  end
end
