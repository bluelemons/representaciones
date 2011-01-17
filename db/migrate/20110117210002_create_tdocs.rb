class CreateTdocs < ActiveRecord::Migration
  def self.up

    create_table :tdocs do |t|
          
      t.string :name
      

      t.timestamps
    end
  end

  def self.down
    drop_table :tdocs
  end
end
