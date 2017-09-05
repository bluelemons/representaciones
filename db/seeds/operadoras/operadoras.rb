require 'dbf'

# erase old data
Operadora.delete_all
# open need tables
operadoras = DBF::Table.new(File.join(Rails.root, 'db', 'seeds', 'operadoras', "OPERADOR.DBF"))
# cache need data
Operadora.all

operadoras.each do |a|
  # debug info
  puts a.attributes
  puts Operadora.create(:name => a.nombre, :calle => a.direccion,
                 :cuit => a.nro_cuit, :telefono => a.telefono,
                 :email => a.e_mail, :web => a.pag_web,
                 :legajo => a.legajo).attributes
end
