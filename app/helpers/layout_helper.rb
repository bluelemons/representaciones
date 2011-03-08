module LayoutHelper

  def error_message(model)
    if model.errors.any?
      html = ""
      html << "<div id= 'error_explanation'>"
      html << "<h2>#{pluralize(model.errors.count, 'error')} no permitieron guardar estos cambios:</h2>"
      html << "<ul>"
      model.errors.full_messages.each do |msg|
        html <<"<li>#{msg}</li>"
      end
      html <<"</ul></div>"
      raw html
    end
  end

  def wysiwug
    content_for(:head) { javascript_include_tag('jquery.cleditor.min')}
    content_for(:head) { stylesheet_link_tag('CLEditor1_3_0/jquery.cleditor')}
    raw "<script>$(function(){$('.wysiwyg').cleditor();});</script>"
  end

  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end


########## aca empizan los links #############3
  def new(model)
    if can? :new, model
      link_to "Nuevo", {:action=>:new,:controller =>model.pluralize.downcase},:remote=>true
    end
  end
  def show(model)
    link_to 'Show', model,:remote=>true
  end

  def edit(model)
    if can? :edit, model
      link_to 'Edit', {:action=>:edit,:controller=>model.class.name.pluralize.downcase,:id=>model.id},:remote=>true
    end
  end

  def destroy(model)
    if can? :destroy, model
      link_to 'Destroy', model, :confirm => 'Are you sure?', :method => :delete,:remote=>true
    end
  end

  def grid_links(model)
    raw "#{show(model)} #{edit(model)} #{destroy(model)}"
  end

  def show_view_links(model)
    edit(model)
  end

  def edit_view_links(model)
    show(model)
  end

  def action_bar(model)
    bar=""
    (bar = show_view_links(model)) if(action_name =="show")
    (bar = edit_view_links(model)) if(action_name =="edit")

    div_for model,:class=>"action_bar" do
      bar
    end

  end
##### terminan los links

end

