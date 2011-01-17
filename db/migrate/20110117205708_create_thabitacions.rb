class CreateThabitacions < ActiveRecord::Migration
  def self.up

    create_table :thabitacions do |t|
          
      t.string :name
      

      t.timestamps
    end
  end

  def self.down
    drop_table :thabitacions
  end
end
