xml.instruct!
xml.pasajeros do
@pasajeros.each do |pasajero|
    xml.pasajeros do
      xml.id pasajero.id
      xml.name pasajero.name
    end
  end
end
