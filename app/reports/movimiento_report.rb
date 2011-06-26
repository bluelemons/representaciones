include Layout
class MovimientoReport < Prawn::Document

  def to_pdf(datos,totales)
    self.font_size = 7

    header "Listado de Movimientos"

    theader = [["ID","Fecha","Entidad","pasajeros","Tipo","Monto"]]
    myrow = theader

    datos.each do |r|
      myrow += [["#{r.try(:reserva).try(:id)}-#{r.try(:reserva).try(:referencia)}","#{r.fecha}","#{r.entidad.try(:type)} #{r.entidad.try(:name)}","#{r.try(:reserva).try(:titular)}","#{r.type}","#{r.monto.format}"]]

    end
    bounding_box [0,690], :width => 500 do
      move_down 10
      table(myrow,{:row_colors => %w[e2f0fb ffffff],
                   :header => true}) do

        row(0).style :background_color => '87b6d9', :text_color => '000000'
        cells.style :borders => []
      end

      move_down 10
      stroke do
        line bounds.top_left, bounds.top_right
        line bounds.bottom_left, bounds.bottom_right

      end
      move_down 10
    end

    mytot = [["$","u$d","Eur"],["#{totales["ARS"]}","#{totales["USD"]}","#{totales["EUR"]}"]]

    table(mytot,{:row_colors => %w[e2f0fb ffffff],
                   :header => true}) do

        row(0).style :background_color => '87b6d9', :text_color => '000000'
        cells.style :borders => []
      end


    render

  end

end

