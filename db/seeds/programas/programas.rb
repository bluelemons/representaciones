require 'dbf'

# erase old data
Programa.delete_all
# open need tables
programas = DBF::Table.new(File.join(Rails.root, 'db', 'seeds', 'programas', "DESTINOS.DBF"))

programas.each do |a|
  # debug info
  puts a.attributes
  puts Programa.create!(:name => a.programa).attributes
end

