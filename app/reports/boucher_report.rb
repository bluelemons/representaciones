#Generado con vistas generator 2011-02-10 19:32:11 -0300 'lib/generators/vistas'
include Layout
class BoucherReport < Prawn::Document

  def to_pdf(datos,params)

    self.font_size = 8

    header "Listado de Reservas"

    draw_text params, :at => [0,700]

    myrow = [["ID","Ref.","Salida","Titular","Boucher","Agencia" ,"Hotel" ]]

    datos.each do |r|
      myrow += [["#{r.id}","#{r.referencia}","#{r.salida}","#{r.titular}","#{r.boucher}","#{r.agency.try(:name)}","#{r.hotel}"]]

    end

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
      move_down 10

    end


    render
  end
end

