require 'dbf'

# erase old data
Operadora.delete_all
# open need tables
operadoras = DBF::Table.new(File.join(Rails.root, 'db', 'seeds', 'operadoras', "OPERADOR.DBF"))
# cache need data
Localidad.all
Operadora.all

operadoras.each do |a|
  # debug info
  puts a.attributes
  if l = Localidad.where("name LIKE ?", a.localidad.gsub!(/\./,"")).try(:first)
    localidad_id = l.id
  else
    localidad_id = nil
  end
  puts Operadora.create(:name => a.nombre, :calle => a.direccion,
                 :cuit => a.nro_cuit, :telefono => a.telefono,
                 :email => a.e_mail, :web => a.pag_web,
                 :localidad_id => localidad_id,
                 :legajo => a.legajo).attributes
end

