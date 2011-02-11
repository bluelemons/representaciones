#Generado con vistas generator 2011-02-10 19:32:11 -0300 'lib/generators/vistas'
include Layout
class ReservaReport < Prawn::Document

  def to_pdf(datos)

    self.font_size = 8

    header

    myrow = [["ID","agencia_id" ,"operadora_id" ]]

    datos.each do |r|
      myrow += [["#{r.id}","#{r.agencia_id}" ,"#{r.operadora_id}" ]]
    end

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

