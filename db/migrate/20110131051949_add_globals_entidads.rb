class AddGlobalsEntidads < ActiveRecord::Migration
  def self.up

    add_column :entidads, :hidden, :boolean, :default => 0
    add_column :entidads, :user_id, :integer

  end

  def self.down
    remove_column :entidads, :hidden
    remove_column :entidads, :user_id
  end
end
