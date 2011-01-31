class TentidadReport < Prawn::Document
    
  def to_pdf(object)    
    
    self.font_size = 8
    
    repeat :all do
      font_size 10 do 
        draw_text "titulo", :at => [0,720.10]
        draw_text "Listado de tentidads", :at => [0,710]
        stroke do
          line bounds.bottom_left, bounds.bottom_right          
        end
      end
      
      font_size 6 do
        draw_text "Impreso: #{Date.today}",:at => [0,5]
        draw_text "Litado de tentidads",:at => [100,5]
        number_pages "<page> de <total>", [bounds.right - 50, 5] 
        draw_text "power by Blue Lemons",:at => [bounds.right - 150, 5] 
      end       
    end
    
    myrow = [["ID"",name" ]]
    object.each do |r|
      myrow += [["#{r.id}"",#{r.name}" ]]
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
