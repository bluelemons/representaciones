class RenameSaldosToCuentas < ActiveRecord::Migration
  def self.up
    rename_table   :saldos, :cuentas
    rename_column  :movimientos, :saldo_id, :cuenta_id
  end

  def self.down
    rename_table   :cuentas, :saldos
    rename_column  :movimientos, :cuenta_id, :saldo_id
  end
end

