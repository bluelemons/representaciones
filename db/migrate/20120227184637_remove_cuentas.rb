class RemoveCuentas < ActiveRecord::Migration
  def self.up
    drop_table :cuentas
  end
end
