class DepositosController < InheritedResources::Base
  load_and_authorize_resource
  
  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Deposito.search(params[:search])
    else
      @search = Deposito.baja.search()
    end
      @depositos = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js 
      format.html
      format.pdf do
        output = DepositoReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf", 
                         :type => "application/pdf"
      end
    end
    
  end
  
  def new
    @deposito.build_movimiento
    new!
  end
  
  def show
    @deposito = Deposito.find(params[:id])
    @deposito.revert_to(params[:version].to_i) if params[:version]
    show! 
  end

  def restore
    @deposito = Deposito.find(params[:id])
    @deposito.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @deposito
  end
  
  def update
    @deposito = Deposito.find(params[:id])
    @deposito.user = current_user
    if @deposito.update_attributes(params[:deposito])
      redirect_to :action => 'show', :id => @deposito, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @deposito = Deposito.new(params[:deposito])
    if params[:pago][:reserva_id]
      @reserva = Reserva.find(params[:pago][:reserva_id])
      #que tipo de entidad tiene el pagador
      @pago = Pago.new()
      @pago.reserva=@reserva
      @pago.entidad = @deposito.entidad
      if @deposito.try(:entidad).try(:tentidad_id)==1 #agencia
        deuda=@reserva.agencia_deuda
      else
        deuda=@reserva.operadora_deuda
      end

      if @deposito.movimiento.monto <= deuda
        @pago.movimiento = @deposito.movimiento
      else
        @pago.build_movimiento
        @pago.movimiento = @deposito.movimiento
        @pago.movimiento.monto = deuda
        #el resto va a el saldo.
        #@deposito.entidad.saldo
      end
                
      @pago.save
    end

    @deposito.user = current_user
    if @deposito.save


      redirect_to :action => 'show', :id => @deposito, :format =>'js'
    else
      render 'new.js'
    end
  end 
  
end
