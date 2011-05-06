class RenameBoucherToVoucher < ActiveRecord::Migration
  def self.up
    rename_column :reservas, :boucher, :voucher
    rename_column :reserva_versions, :boucher, :voucher
  end

  def self.down
    rename_column :reservas, :voucher, :boucher
    rename_column :reserva_versions, :voucher, :boucher
  end
end

