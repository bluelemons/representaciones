class DatosDePrueba < ActiveRecord::Migration
  def self.up
    Tdoc.new(:name =>'DNI').save
    Tdoc.new(:name =>'LE').save
    Tdoc.new(:name =>'LC').save
    Pasajero.new(:doc=>28684242,:name =>"Oldani Pablo",:nacimiento=>"1981-10-4").save
    Pasajero.new(:doc=>31257560,:name =>"Dosso Liza",:nacimiento=>"1984-10-15").save
    Pasajero.new(:doc=>32454325,:name =>"Espinaco Eloy",:nacimiento=>"1985-06-14").save
    Agencia.new(:name=>'Pirulo').save
    Agencia.new(:name=>'Mengano').save
    Programa.new(:name => "Bariloche").save
    Programa.new(:name => "Brasil").save
    Thabitacion.new(:name =>"Simple").save
    Thabitacion.new(:name =>"Doble").save
    Operadora.new(:name =>"Daniel").save
    Operadora.new(:name =>"Cristina").save

  end

  def self.down
  end
end
