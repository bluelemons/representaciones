include Layout
class MovimientoReport < Prawn::Document

  def to_pdf(datos)
    self.font_size = 8

    header "Listado de Movimientos"

    theader = [["Fecha","Entidad","Reserva","pasajeros","Monto"]]
    myrow = theader

    datos.each do |r|
      myrow += [["#{r.fecha}","#{r.entidad.try(:type)} #{r.entidad.try(:name)}","#{r.reserva.titular if r.reserva}","#{r.reserva.try(:id)} - #{r.reserva.try(:referencia)}","#{r.monto.format}"]]

    end
    bounding_box [0,690], :width => 500 do
      move_down 10
      table(myrow,{:row_colors => %w[bbcef4 ffffff],
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


    render

  end

end

