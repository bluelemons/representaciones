class PasajerosController < InheritedResources::Base
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Pasajero.search(params[:search])
    else
      @search = Pasajero.baja.search()
    end
      @pasajeros = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.xml
      format.html
      format.pdf do
        output = PasajeroReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def show
    @pasajero = Pasajero.find(params[:id])
    @pasajero.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @pasajero = Pasajero.find(params[:id])
    @pasajero.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @pasajero
  end
  
  def update
    @pasajero = Pasajero.find(params[:id])
    @pasajero.user = current_user
    if @pasajero.update_attributes(params[:pasajero])
      redirect_to :action => 'show', :id => @pasajero, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @pasajero = Pasajero.new(params[:pasajero])
    @pasajero.user = current_user
    if @pasajero.save
      redirect_to :action => 'show', :id => @pasajero, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
