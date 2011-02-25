class CreateMonedas < ActiveRecord::Migration
  def self.up
    create_table :monedas do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :monedas
  end
end
