class MovimientosController < InheritedResources::Base
  load_and_authorize_resource
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Movimiento.search(params[:search])
    else
      @search = Movimiento.baja.search()
    end
      @movimientos = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = MovimientoReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  def new
    @movimiento.build_monto
    new!
  end
  def show
    @movimiento = Movimiento.find(params[:id])
    @movimiento.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @movimiento = Movimiento.find(params[:id])
    @movimiento.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @pago
  end
  
  def update
    @movimiento = Movimiento.find(params[:id])
    @movimiento.user = current_user
    if @movimiento.update_attributes(params[:movimiento])
      redirect_to :action => 'show', :id => @pago, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @movimiento = Movimiento.new(params[:movimiento])
    @movimiento.user = current_user
    if @movimiento.save
      if @movimiento.tpago_id==1
        @movimiento.entidad.deposit(@movimiento.monto)
      else
        @movimiento.entidad.withdraw(@movimiento.monto)
      end
      redirect_to :action => 'new', :id => @movimiento, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
