class TarifasController < InheritedResources::Base
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Tarifa.search(params[:search])
    else
      @search = Tarifa.baja.search()
    end
      @tarifas = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = TarifaReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def show
    @tarifa = Tarifa.find(params[:id])
    @tarifa.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @tarifa = Tarifa.find(params[:id])
    @tarifa.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @tarifa
  end
  
  def update
    @tarifa = Tarifa.find(params[:id])
    @tarifa.user = current_user
    if @tarifa.update_attributes(params[:tarifa])
      redirect_to :action => 'show', :id => @tarifa, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @tarifa = Tarifa.new(params[:tarifa])
    @tarifa.user = current_user
    if @tarifa.save
      redirect_to :action => 'show', :id => @tarifa, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
