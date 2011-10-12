module LayoutHelper

  # Output current time in a string without spaces
  def time_id
    Time.current.strftime("%F_%H:%M:%S,%N")
  end

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

end

