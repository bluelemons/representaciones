module Layout
  def header(title)
    repeat :all do
      font_size 10 do
        draw_text "titulo", :at => [0,720.10]
        draw_text "Listado de #{title}", :at => [0,710]
        stroke do
          line bounds.bottom_left, bounds.bottom_right
        end
      end

      font_size 6 do
        draw_text "Impreso: #{Date.today}",:at => [0,5]
        draw_text "Litado de #{title}",:at => [100,5]
        number_pages "<page> de <total>", [bounds.right - 50, 5]
        draw_text "power by Blue Lemons",:at => [bounds.right - 150, 5]
      end
    end
  end
end

