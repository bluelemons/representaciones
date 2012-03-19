class Cotizacion < ActiveRecord::Base
  #clases
  #acts_as_versioned
  #asociaciones
  #belongs_to :moneda
#  scope :por_fecha, lambda {|fecha| where("fecha = ?",fecha) }
#  scope :por_moneda_compra, lambda {|moneda| where("moneda_compra = ?",moneda.currency.id)}
##
#  scope :por_moneda_venta, lambda {|moneda| where("moneda_venta = ?",moneda.currency.id)}

#  scope :buscar, lambda{|fecha,moneda1,moneda2| por_fecha(fecha).por_moneda_compra(moneda1).por_moneda_venta(moneda2).limit(1)}

  #validaciones
  validates :fecha, :presence => true
  validates :moneda_compra, :presence => true
  validates :moneda_venta, :presence => true
  validates :compra, :presence => true
  #validates :venta, :presence => true
  #metodos

  # Agrega la cotización al default_bank.
  def add_rate
    Money.add_rate(moneda_venta, moneda_compra, compra)
    Money.add_rate(moneda_compra, moneda_venta, 1.0/compra)
  end
  def self.buscar(f,curr_1,curr_2)
    curr_1 = curr_1.currency.id
    curr_2 = curr_2.currency.id
    self.find_by_fecha_and_moneda_compra_and_moneda_venta(f,curr_1, curr_2) ||
      self.find_by_fecha_and_moneda_compra_and_moneda_venta(f,curr_2, curr_1)
  end
end

