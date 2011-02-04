class Cotizacion < ActiveRecord::Base
  belongs_to :moneda
  
  scope :por_fecha, lambda {|fecha| where("fecha >= ?",fecha) } 
  scope :por_moneda, lambda {|moneda| where("moneda_id = ?",moneda)} 
  
  scope :a_la_fecha, lambda{|fecha,moneda| por_fecha(fecha).por_moneda(moneda).limit(1)}

end
