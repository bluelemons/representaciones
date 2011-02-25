class CreateProgramas < ActiveRecord::Migration
  def self.up
    create_table :programas do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :programas
  end
end
