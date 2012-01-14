class AddMontoFinalToDeposito < ActiveRecord::Migration
  def self.up
    add_column :movimientos, :monto_final_cents, :integer
    add_column :movimientos, :monto_final_currency, :string, :limit => 3
  end

  def self.down
    remove_column :movimientos, :monto_final_currency
    remove_column :movimientos, :monto_final_cents
  end
end

