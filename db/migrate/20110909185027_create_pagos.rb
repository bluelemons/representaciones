class CreatePagos < ActiveRecord::Migration
  def self.up
    create_table :pagos do |t|
      t.date :fecha
      t.integer :entidad_id
      t.integer :reserva_id
      t.integer :monto_cents
      t.string :monto_currency, :limit => 3
      t.integer :monto_original_cents
      t.string :monto_original_currency, :limit => 3
      t.integer :operadora_id
      t.integer :tdeposito_id
      t.string :numero
      t.text :observaciones
      t.integer :user_id
      t.boolean :hidden

      t.timestamps
    end
  end

  def self.down
    drop_table :pagos
  end
end
