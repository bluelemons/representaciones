class AddLiquidadaToReservas < ActiveRecord::Migration
  def self.up
    add_column :reservas, :liquido_agencia, :boolean, :default => false
    add_column :reservas, :liquido_operadora, :boolean, :default => false
    add_column :reserva_versions, :liquido_agencia, :boolean, :default => false
    add_column :reserva_versions, :liquido_operadora, :boolean, :default => false
  end

  def self.down
    remove_column :reservas, :liquido_operadora
    remove_column :reservas, :liquido_agencia
    remove_column :reserva_versions, :liquido_operadora
    remove_column :reserva_versions, :liquido_agencia
  end
end

