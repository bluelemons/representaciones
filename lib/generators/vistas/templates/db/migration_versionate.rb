class AddVersionate<%= plural_name.capitalize %> < ActiveRecord::Migration

  def self.up
    <%= file_name_c %>.create_versioned_table
  end

  def self.down
    drop_table :<%=file_name%>_versions
  end
  
end
