class EntidadsController < InheritedResources::Base
  load_and_authorize_resource

  respond_to :html, :xml,:js


  def index
    if params[:search]
      @search = Entidad.search(params[:search])
    else
      @search = Entidad.baja.search()
    end
      @entidads = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        output = EntidadReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end

  end

  def show
    @entidad.revert_to(params[:version].to_i) if params[:version]
    show!
  end

  def restore
    @entidad = Entidad.find(params[:id])
    @entidad.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @entidad
  end

  def update
    @entidad = Entidad.find(params[:id])
    @entidad.user = current_user
    if @entidad.update_attributes(params[:entidad])
      redirect_to :action => 'show', :id => @entidad, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @entidad = Entidad.new(params[:entidad])
    @entidad.user = current_user
    if @entidad.save
      flash[:notice]="Entidad guardada!"
      #creo el saldo para cada tipo de moneda
      Moneda.all.each do |moneda|
        monto = Monto.create(:valor=>0,:moneda=>moneda)
        Saldo.create({:entidad_id=>@entidad.id,:moneda_id=>moneda.id,:monto=>monto})
      end

      if params[:another_one]
        redirect_to :action => 'new', :format =>'js'
      else
        redirect_to :action => 'show', :id => @entidad, :format =>'js'
      end

    else
      render 'new.js'
    end
  end

end

