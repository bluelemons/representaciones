class CreateTdepositos < ActiveRecord::Migration
  def self.up

    create_table :tdepositos do |t|
          
      t.string :name
      

      t.timestamps
    end
  end

  def self.down
    drop_table :tdepositos
  end
end
