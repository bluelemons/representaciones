require 'dbf'

# erase old data
Agency.delete_all
# open need tables
agencias = DBF::Table.new(File.join(Rails.root, 'db', 'seeds', 'agencias', "AGENCIA.DBF"))
# cache need data
Agency.all

agencias.each do |a|
  # debug info
  puts a.attributes
  puts Agency.create(:name => a.nombre, :calle => a.direccion,
                 :cuit => a.nro_cuit, :telefono => a.telefono,
                 :email => a.e_mail, :web => a.pag_web).inspect
end
