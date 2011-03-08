module LinksHelper

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

end

