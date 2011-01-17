class AddGlobalsTdocs < ActiveRecord::Migration
  def self.up

    add_column :tdocs, :hidden, :boolean, :default => 0
    add_column :tdocs, :user_id, :integer

  end

  def self.down
    remove_column :tdocs, :hidden
    remove_column :tdocs, :user_id
  end
end
