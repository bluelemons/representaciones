xml.instruct!
xml.pasajeros do
@pasajeros.each do |pasajero|
    xml.pasajero do
      xml.id pasajero.id
      xml.doc pasajero.doc
      xml.name pasajero.name
    end
  end
end
