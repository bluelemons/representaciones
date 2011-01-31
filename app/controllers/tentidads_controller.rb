class TentidadsController < InheritedResources::Base
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Tentidad.search(params[:search])
    else
      @search = Tentidad.baja.search()
    end
      @tentidads = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = TentidadReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def show
    @tentidad = Tentidad.find(params[:id])
    @tentidad.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @tentidad = Tentidad.find(params[:id])
    @tentidad.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @tentidad
  end
  
  def update
    @tentidad = Tentidad.find(params[:id])
    @tentidad.user = current_user
    if @tentidad.update_attributes(params[:tentidad])
      redirect_to :action => 'show', :id => @tentidad, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @tentidad = Tentidad.new(params[:tentidad])
    @tentidad.user = current_user
    if @tentidad.save
      redirect_to :action => 'show', :id => @tentidad, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
