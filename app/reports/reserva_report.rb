#Generado con vistas generator 2011-02-10 19:32:11 -0300 'lib/generators/vistas'
include Layout
class ReservaReport < Prawn::Document

  def regular(datos,params)

    # Tamaño de la letra por defecto
    self.font_size = 7

    # Titulo del listado, definido en /app/reports/layout.rb
    header "Listado de Reservas"

    # Header de la tabla
    myrowheader = [["ID","#","Pasajeros","Salida","Hotel","Programa","Total","Agencia" ,"Pagos","Deuda","Pagos O","Deuda O" ]]

    bounding_box [0,690], :width => 500 do

      #hago una tabla por cada operadora
      datos.group_by(&:dia_creado).each do |fecha, operadoras|
        text "Fecha: #{fecha}",:size=>10
        operadoras.group_by(&:operadora).each do |operadora, reservas|
          if(operadora and reservas)

            #escribo el nombre de la operadora antes de cada tabla
            text "Operadora: #{operadora.name}",:size=>8

            move_down 10
            rows = myrowheader

            reservas.each do|r|
              rows += [["#{r.id}-#{r.try(:referencia)}","#{r.pasajeros.count}","#{r.titular}","#{r.salida}","#{r.hotel[0..15]}","#{r.programa[0..15]}","#{r.total.format}","#{r.agency.try(:name)}" ,"#{r.agencia_pago.format}","#{r.agencia_deuda.format}","#{r.operadora_pago.format}","#{r.operadora_deuda.format}"]]
            end

            table(rows,{:row_colors => %w[e2f0fb ffffff],
                     :header => false,
                     :column_widths =>{0=>60,
                                      1=>20,
                                      2=>60,
                                      3=>50,
                                      4=>50,
                                      5=>60

                                      }})do

              row(0).style :background_color => '87b6d9', :text_color => '000000'
              cells.style :borders => []
            end

          #despues de cada operadora se puede hacer un start_new_page que hace un salto de pagina o simplemente mover algunas posicion con move_down
          #start_new_page
            move_down 20
          end
        end
      end

    end


    render
  end
end

