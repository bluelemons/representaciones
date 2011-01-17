class DireccionsController < InheritedResources::Base
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Direccion.search(params[:search])
    else
      @search = Direccion.baja.search()
    end
      @direccions = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = DireccionReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def show
    @direccion = Direccion.find(params[:id])
    @direccion.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @direccion = Direccion.find(params[:id])
    @direccion.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @direccion
  end
  
  def update
    @direccion = Direccion.find(params[:id])
    @direccion.user = current_user
    if @direccion.update_attributes(params[:direccion])
      redirect_to :action => 'show', :id => @direccion, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @direccion = Direccion.new(params[:direccion])
    @direccion.user = current_user
    if @direccion.save
      redirect_to :action => 'show', :id => @direccion, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
