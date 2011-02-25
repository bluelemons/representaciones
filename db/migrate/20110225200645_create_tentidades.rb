class CreateTentidades < ActiveRecord::Migration
  def self.up
    create_table :tentidades do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :tentidades
  end
end
