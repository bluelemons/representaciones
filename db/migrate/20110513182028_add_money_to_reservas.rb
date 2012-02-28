class AddMoneyToReservas < ActiveRecord::Migration
  def self.up
    [:reservas].each do |tabla|
      change_table tabla do |t|
        t.integer :total_cents
        t.string  :total_currency, :limit => 3
        t.integer :iva_cents
        t.integer :tarifa_cents
        t.integer :aereo_cents
        t.integer :otros_cents
        t.integer :pago_minimo_cents
        t.integer :impuesto_cents
        t.integer :seguro_cents
      end
    end
  end

  def self.down
    [:reservas].each do |tabla|
      change_table tabla do |t|
        t.remove :total_cents
        t.remove :total_currency
        t.remove :iva_cents
        t.remove :tarifa_cents
        t.remove :aereo_cents
        t.remove :otros_cents
        t.remove :pago_minimo_cents
        t.remove :impuesto_cents
        t.remove :seguro_cents
      end
    end
  end
end
