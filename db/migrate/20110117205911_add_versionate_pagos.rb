class AddVersionatePagos < ActiveRecord::Migration

  def self.up
    Pago.create_versioned_table
  end

  def self.down
    drop_table :pago_versions
  end
  
end
