class AddGlobals<%= plural_name.capitalize %> < ActiveRecord::Migration
  def self.up

    add_column :<%= plural_name %>, :hidden, :boolean, :default => 0
    add_column :<%= plural_name %>, :user_id, :integer

  end

  def self.down
    remove_column :<%= plural_name %>, :hidden
    remove_column :<%= plural_name %>, :user_id
  end
end
