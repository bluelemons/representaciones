include Layout
class EntidadReport < Prawn::Document

  def to_pdf(datos)

    #tamaño de la fuente por defecto para el reporte
    self.font_size = 8

    #imprime el header del reporte
    header("Entidades")

    #renglon de la tabla que tiene los nombre de la columnas
    myrow = [["ID","Nombre" ,"cuit","telefono" ,"legajo" ,"email" ,"web" ,"localidad_id" ,"calle" ,"tentidad_id" ]]

    #a cada uno de los datos enviados por el controlador los pongo en el array myrow
    datos.each do |r|
      myrow += [["#{r.id}","#{r.name}" ,"#{r.cuit}" ,"#{r.telefono}" ,"#{r.legajo}" ,"#{r.email}" ,"#{r.web}" ,"#{r.localidad_id}" ,"#{r.calle}" ,"#{r.tentidad_id}" ]]
    end

    #hago una tabla con los datos
    bounding_box [0,690], :width => 500 do
      move_down 10

      table(myrow,:row_colors => %w[cccccc ffffff])do

        row(0).style :background_color => '000000', :text_color => 'ffffff'
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

