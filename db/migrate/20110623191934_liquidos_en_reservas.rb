class LiquidosEnReservas < ActiveRecord::Migration
  def self.up
    Reserva.all.each do |r|
      if r.total.nonzero?
        r.liquido_agencia   = true if r.agency_deuda.cents    <= 0
        r.liquido_operadora = true if r.operadora_deuda.cents <= 0
        r.save!
      end
    end
  end

  def self.down
  end
end

