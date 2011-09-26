# coding: utf-8
#Generado con vistas generator 2011-02-10 19:32:11 -0300 'lib/generators/vistas'
include Layout
class ReservaReport < Prawn::Document

  def regular(datos, params)

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

  def situacion_operadora(datos, params)
    # top: 720.0; left: 0; right: 540.0; bottom: 0

    # Tamaño de la letra por defecto
    self.font_size = 7
    @title = "Listado de Reservas"
    # Titulo del listado, definido en /app/reports/layout.rb
    header @title

    header_row = [ %w[  ID-referencia
                        Titular(#)
                        Agencia
                        Salida
                        Monto
                        Deuda-A
                        Deuda-O ] ]

    valores_tabla = datos.all.map do |r|
      data_row = %W[  #{r.id}-#{r.try(:referencia)}
                      #{r.titular.split(/,/)[0][0,8]}(#{r.pasajeros.count})
                      #{r.agency.try(:name)[0,10]}
                      #{r.salida}
                      #{r.total.format}
                      #{r.agencia_deuda.format}
                      #{r.operadora_deuda.format} ]
    end

    widths = { 1 => 60, 2 => 60, 3 => 60, 4 => 60, 5 => 60, 6 => 60 }

    calcular_totales(datos)

    totales = [ [ "TOTALES:", "", "", "",
      @monto_total.values.map {|m| m.format}.join(" "),
      @deuda_agencia_total.values.map {|m| m.format}.join(" "),
      @deuda_operadora_total.values.map {|m| m.format}.join(" ")
      ] ]

    rows = header_row + valores_tabla + totales

    bounding_box [20, bounds.top - 30], :width => 500, :height => bounds.top-30*2 do

      informacion_de_busqueda(datos)

      move_down 10

      table rows, :header => true,
                  :row_colors => %w[e2f0fb ffffff],
                  :column_widths => widths do
        cells.style :borders => [:top], :overflow => :expand
        money_data = column(4..6)
        money_data.style :align => :right
        # encabezado
        row(0).style :background_color => '87b6d9', :text_color => '000000', :align => :center
        # fila de totales:
        row(-1).style :font_style => :bold
      end
    end

    number_pages "<page> de <total>", {:at => [bounds.right - 50, 0], :align => :right}

    render
  end

  def informacion_de_busqueda(datos)
    busqueda = {}
    datos.search_attributes.except('meta_sort').select {|k, v| v.present?}.each do |key, value|
      busqueda[datos.class.human_attribute_name(key.dup)] = value
    end
    text busqueda.to_yaml
  end

  def calcular_totales(datos)
    @monto_total, @deuda_agencia_total, @deuda_operadora_total = {}, {}, {}
    datos.all.each do |r|
      moneda = r.total.currency
      if @monto_total[moneda].nil?
        @monto_total[moneda] = r.total unless r.total.cents <= 10
      else
        @monto_total[moneda] += r.total
      end

      if @deuda_agencia_total[moneda].nil?
        @deuda_agencia_total[moneda] = r.agencia_deuda unless r.total.cents <= 10
      else
        @deuda_agencia_total[moneda] += r.agencia_deuda
      end

      if @deuda_operadora_total[moneda].nil?
        @deuda_operadora_total[moneda] = r.operadora_deuda unless r.total.cents <= 10
      else
        @deuda_operadora_total[moneda] += r.operadora_deuda
      end
    end
  end
end

