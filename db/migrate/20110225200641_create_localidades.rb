class CreateLocalidades < ActiveRecord::Migration
  def self.up
    create_table :localidades do |t|
      t.string :name
      t.integer :postal

      t.timestamps
    end
  end

  def self.down
    drop_table :localidades
  end
end
