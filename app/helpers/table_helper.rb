module TableHelper

  def table_form(model,data,html)
    tt=""
    for a in data
      tt+="<tr><td><b>#{table_form_name(a)}</b></td><td>#{table_form_data(model,a)}</td></tr>"
    end
    raw "<table class='#{html[:class]}'>#{tt}</table>"
  end

  def table_form_data(model,a)
    if a[:value]
      return model.send(a[:value])
    else
      return a[:string]
    end
  end

  def table_form_name(a)
    (a[:name] || a[:value]).capitalize
  end


  def grilla(header,model,data,html)
    raw "<table id ='#{html[:id]}' class='#{html[:class]}'><tr>#{table_th(header)}</tr>#{body(model,data)}</table>"
  end

  def table_th(array)
    raw table_tag(array,"th")
  end

  def table_td(array)
    table_tag(array,"td")
  end

  def table_tag(array,tag)
    tt=""
    if(array.class.name!="Array")
      array =[array]
    end
    array.each do |data|
      tt+="<#{tag}>#{data}</#{tag}>"
    end
    tt
  end

  def body(model,data)
    tt=""

    for m in model
      ttt=""
      for d in data
        ttt+= table_tag(m.send(d),"td")
      end
      ttt += "<td>#{grid_links(m)}</td>"
      tt += "<tr>#{ttt}</tr>"
    end

    raw tt


  end

end

