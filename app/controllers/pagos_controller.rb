class PagosController < InheritedResources::Base
  def index
  end

  def new
    @pago = Pago.new
    @pago.build_monto
    @search = Reserva.baja.search(:agency_id_eq=>0)
    @reservas = @search.paginate :page => params[:page], :per_page =>10
  end

  def create
    @pago = Pago.new(params[:pago])
    @pago.user = current_user
    #genero deposito

    #si uso la opcion de depositar
    if !(params[:use_saldo])
      deposito = Deposito.new(params[:pago])
      deposito.save
      flash[:notice] = "#{deposito.errors}"
      @pago.saldo = deposito.entidad.get_saldo(deposito.monto.moneda.id)
    end
    #debe tomar el saldo en el que deposite.
    tipo = @pago.entidad.type
    deuda = @pago.reserva.send((tipo.downcase + "_deuda").to_sym, :monto)
    if @pago.monto.to(1, @pago.fecha) > deuda.to(1,@pago.fecha)
      m = @pago.monto
      m.valor = deuda.to(@pago.monto.moneda_id, @pago.fecha)
      #m.save
    end
    if @pago.save
      flash[:notice] = "Por fin pagaron"
      redirect_to :action => 'new', :format =>'js'
    else
      @pago.build_monto
      @search = Reserva.baja.search(:agency_id_eq=>0)
      @reservas = @search.paginate :page => params[:page], :per_page =>10
      render 'new.js'
    end
  end

end

