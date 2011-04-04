class AddMoneyToSaldo < ActiveRecord::Migration
  class Saldo < ActiveRecord::Base ; end
  def self.up
    add_column    :saldos, :monto_cents, :integer
    add_column    :saldos, :monto_currency, :string, :limit => 3
    remove_column :saldos, :monto_id
  end

  def self.down
    remove_column :saldos, :monto_currency
    remove_column :saldos, :monto_cents
    add_column    :saldos, :monto_id, :integer
  end
end

