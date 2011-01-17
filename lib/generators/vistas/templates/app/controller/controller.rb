class <%=plural_name.capitalize%>Controller < InheritedResources::Base
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = <%= file_name_c %>.search(params[:search])
    else
      @search = <%= file_name_c %>.baja.search()
    end
      @<%=plural_name%> = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = <%= file_name_c %>Report.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def show
    @<%= file_name %> = <%= file_name_c %>.find(params[:id])
    @<%= file_name %>.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @<%= file_name %> = <%= file_name_c %>.find(params[:id])
    @<%= file_name %>.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @<%= file_name %>
  end
  
  def update
    @<%= file_name %> = <%= file_name_c %>.find(params[:id])
    @<%= file_name %>.user = current_user
    if @<%= file_name %>.update_attributes(params[:<%= file_name %>])
      redirect_to :action => 'show', :id => @<%= file_name %>, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @<%= file_name %> = <%= file_name_c %>.new(params[:<%= file_name %>])
    @<%= file_name %>.user = current_user
    if @<%= file_name %>.save
      redirect_to :action => 'show', :id => @<%= file_name %>, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
