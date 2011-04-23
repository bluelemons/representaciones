include Layout
class EntidadReport < Prawn::Document

  def to_pdf(datos)

    #tamaño de la fuente por defecto para el reporte
    self.font_size = 8

    #imprime el header del reporte
    header(datos.first.type)

    #renglon de la tabla que tiene los nombre de la columnas
    myrow = [["ID","Nombre" ,"CUIT","Telefono" ,"Legajo", "Direccion","Deuda $","Deuda u$s","Deuda euros" ]]

    #a cada uno de los datos enviados por el controlador los pongo en el array myrow
    datos.each do |r|
      deuda = Array.new(4,0)
      r.reservas.each do |reserva|
        deuda[reserva.moneda_id] += reserva.send((r.type.downcase + "_deuda").to_sym)
      end
      myrow += [["#{r.id}","#{r.name}" ,"#{r.cuit}" ,"#{r.telefono}" ,"#{r.legajo}" ,"#{r.calle} #{r.localidad.try(:name)}" ,"#{deuda[0]}","#{deuda[1]}","#{deuda[2]}"]]

    end

    #hago una tabla con los datos
    bounding_box [0,690], :width => 500 do
      move_down 10

      table(myrow,{:row_colors => %w[bbcef4 ffffff],:header=>true})do

        row(0).style :background_color => '87b6d9', :text_color => '000000'
        cells.style :borders => []
      end

      move_down 10
      stroke do
        line bounds.top_left, bounds.top_right
        line bounds.bottom_left, bounds.bottom_right

      end

    end


    render
  end
end

