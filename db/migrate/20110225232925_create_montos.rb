class CreateMontos < ActiveRecord::Migration
  def self.up
    create_table :montos do |t|
      t.float :valor
      t.integer :moneda_id
      t.timestamps
    end
  end

  def self.down
    drop_table :montos
  end
end

