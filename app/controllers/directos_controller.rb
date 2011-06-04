class DirectosController < InheritedResources::Base
  def index
  end

  def new
    @deposito = Deposito.new
    @pago = Pago.new
    @cambio = Cambio.new
    @directo = Directo.new
    @search = Reserva.baja.search(:agency_id_eq=>0)
    @reservas = @search.paginate :page => params[:page], :per_page =>10
  end

  def create
    # 1. Deposita el dinera en saldo
    # 2. Graba un cambio si lo hubiese
    # 3. Graba el pago.

    @directo = Directo.new(params[:directo])
    @deposito = Deposito.new(params[:directo])
    @pago = Pago.new(params[:directo])


    #si el pago es sobre una serva con otra moneda tiene que
    #tambien hacer un cambio

    @deposito.user = current_user
    @pago.user = current_user

    ActiveRecord::Base.transaction do
      if @deposito.save
        if @deposito.monto.currency != @deposito.reserva.total.currency
          @cambio = Cambio.new(params[:directo])

          #actualizo la cuenta de cambio.
          @cambio.cuenta = @deposito.cuenta

          c = Cotizacion.buscar(@deposito.fecha,@deposito.reserva.total,@deposito.cuenta.monto).first
          c.add_rate

          puts @cambio.monto
          @cambio.monto = @cambio.monto.exchange_to(@deposito.reserva.total.currency)
          @pago.cuenta = @cambio.cuenta_objetivo
          @pago.monto = @cambio.monto
          @cambio.user = current_user
          puts @cambio.monto
          puts @cambio.inspect
          end
          puts @cambio.monto.currency
          puts @pago.monto.currency
          puts @deposito.monto.currency
          if @cambio.save and @pago.save
            flash[:notice] = "El pago a sido registrado"
            redirect_to :action => 'new', :format =>'js'
          else
            @search = Reserva.baja.search(:agency_id_eq=>0)
            @reservas = @search.paginate :page => params[:page], :per_page =>10
            render 'new.js'
          end
      else
        @search = Reserva.baja.search(:agency_id_eq=>0)
        @reservas = @search.paginate :page => params[:page], :per_page =>10
        render 'new.js'
      end
    end
  end
end

