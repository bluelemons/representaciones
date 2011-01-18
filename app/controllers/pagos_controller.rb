class PagosController < InheritedResources::Base
  load_and_authorize_resource
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Pago.search(params[:search])
    else
      @search = Pago.baja.search()
    end
      @pagos = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = PagoReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def show
    @pago = Pago.find(params[:id])
    @pago.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @pago = Pago.find(params[:id])
    @pago.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @pago
  end
  
  def update
    @pago = Pago.find(params[:id])
    @pago.user = current_user
    if @pago.update_attributes(params[:pago])
      redirect_to :action => 'show', :id => @pago, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @pago = Pago.new(params[:pago])
    @pago.user = current_user
    if @pago.save
      redirect_to :action => 'show', :id => @pago, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
