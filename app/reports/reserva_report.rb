#Generado con vistas generator 2011-02-10 19:32:11 -0300 'lib/generators/vistas'
include Layout
class ReservaReport < Prawn::Document

  def regular(datos,params)

    self.font_size = 8

    header "Listado de Reservas"

    draw_text params, :at => [0,700]

    myrow = [["ID","#","Pasajeros","Salida","Total","Agencia" ,"Pagos","Deuda","Operadora","Pagos","Deuda" ]]
    totales = Array.new(4,0)
    agencia_pago = Array.new(4,0)
    operadora_pago = Array.new(4,0)
    agencia_deuda = Array.new(4,0)
    operadora_deuda = Array.new(4,0)

    datos.each do |r|
      myrow += [["#{r.id}","#{r.pasajeros.count}","#{r.titular}","#{r.salida}","#{r.total.format}","#{r.agency.try(:name)}" ,"#{r.agencia_pago}","#{r.agencia_deuda}","#{r.operadora.try(:name)}","#{r.operadora_pago}","#{r.operadora_deuda}" ]]

#      agencia_pago[r.monto.moneda_id-1] += r.agencia_pago
#      operadora_pago[r.monto.moneda_id-1] += r.operadora_pago
#      agencia_deuda[r.monto.moneda_id-1] += r.agencia_deuda
#      operadora_deuda[r.monto.moneda_id-1] += r.operadora_deuda
    end

    bounding_box [0,690], :width => 500 do
      move_down 10
      table(myrow,{:row_colors => %w[bbcef4 ffffff],
                   :header => true,
                   :column_widths =>{0=>40,
                                    1=>20,
                                    3=>60}})do

        row(0).style :background_color => '87b6d9', :text_color => '000000'
        cells.style :borders => []
      end

      move_down 10
      stroke do
        line bounds.top_left, bounds.top_right
        line bounds.bottom_left, bounds.bottom_right

      end
      move_down 10
#      total =[["Totales","Pago Agencia","Operadora Pago","Agencia Deuda","Operadora Deuda"]]
#      total +=[["Pesos:","#{agencia_pago[0]}","#{operadora_pago[0]}","#{agencia_deuda[0]}","#{operadora_deuda[0]}"]]
#      total +=[["Dolares:","#{agencia_pago[1]}","#{operadora_pago[1]}","#{agencia_deuda[1]}","#{operadora_deuda[1]}"]]
#      total +=[["Euros:","#{agencia_pago[2]}","#{operadora_pago[2]}","#{agencia_deuda[2]}","#{operadora_deuda[2]}"]]

#      table(total,:row_colors => %w[ffffff],:header=>true)do

#        row(0).style :background_color => 'edbc5e', :text_color => '000000'
#        cells.style :border_width =>0.5
#
#      end

    end


    render
  end
end

