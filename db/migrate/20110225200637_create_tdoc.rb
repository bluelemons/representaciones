class CreateTdoc < ActiveRecord::Migration
  def self.up
    create_table :tdoc do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :tdoc
  end
end
