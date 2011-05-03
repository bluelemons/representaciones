class AddMoneyToMovimientos < ActiveRecord::Migration
  def self.up
    add_column :movimientos, :monto_cents, :integer
    add_column :movimientos, :monto_currency, :string, :limit => 3
  end

  def self.down
    remove_column :movimientos, :monto_currency
    remove_column :movimientos, :monto_cents
  end
end

