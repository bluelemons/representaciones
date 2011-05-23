class DeleteTpagosAndTentidads < ActiveRecord::Migration
  def self.drop_existing_table(table)
    if ActiveRecord::Base.connection.tables.include?(table.to_s)
      drop_table table
    end
  end
  def self.up
    drop_existing_table :tpagos
    drop_existing_table :tpago_versions
    drop_existing_table :tentidads
    drop_existing_table :tentidad_versions
  end

  def self.down
  end
end

