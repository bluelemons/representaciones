class DirectosController < ApplicationController
  #load_and_authorize_resource

  def index
  end

  def new
    @directo = Directo.new
    @directo.build_monto
    @search = Reserva.baja.search(:agency_id_eq=>0)
    @reservas = @search.paginate :page => params[:page], :per_page =>10
  end

  def create
    @directo = Directo.new(params[:directo])
    @directo.user = current_user
    if @directo.save
      agencia = @directo.entidad
      operadora = Operadora.find(params[:search][:operadora_id_eq])
      moneda_id =@directo.monto.moneda_id
      #genero el deposito.
      agencia.deposit_by(operadora,@directo.monto)

      #genero el pago
      # un pago de la agencia.
      cuenta_a = agencia.cuenta(moneda_id,operadora)
      valid = @directo.pago(agencia,cuenta_a)

      #un pago de la operadora
      cuenta_o = operadora.cuenta(moneda_id)
      @directo.pago(operadora,cuenta_o)


      flash[:notice] = "#{valid.errors}"
      redirect_to :action => 'new', :format =>'js'
    else
      @search = Reserva.baja.search(params[:search])
      @reservas = @search.paginate :page => params[:page], :per_page =>10
      @directo.build_monto
      render 'new.js'
    end
  end

end

