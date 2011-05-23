require 'dbf'

# erase old data
Agency.delete_all
# open need tables
agencias = DBF::Table.new(File.join(Rails.root, 'db', 'seeds', 'agencias', "AGENCIA.DBF"))
# cache need data
Localidad.all
Agency.all

agencias.each do |a|
  # debug info
  puts a.attributes
  if l = Localidad.where("name LIKE ?", a.localidad.gsub!(/\./,"")).try(:first)
    localidad_id = l.id
  else
    localidad_id = nil
  end
  puts Agency.create(:name => a.nombre, :calle => a.direccion,
                 :cuit => a.nro_cuit, :telefono => a.telefono,
                 :email => a.e_mail, :web => a.pag_web,
                 :localidad_id => localidad_id).inspect
end

