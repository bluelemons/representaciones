class EntidadsController < InheritedResources::Base
  load_and_authorize_resource

  respond_to :html, :xml,:js,:json


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

  def edit
    render 'entidads/edit.js'
  end


  def show
    @entidad = Entidad.find(params[:id])
    @entidad.revert_to(params[:version].to_i) if params[:version]
    @total = Movimiento.total(@entidad.movimientos)
    render 'entidads/show.js'
  end

  def update
    @entidad = Entidad.find(params[:id])
    if @entidad.update_attributes(params[@entidad.type.downcase.to_sym])
      redirect_to :action => 'show',:controller=>"entidads", :id => @entidad, :format =>'js'
    else
      render 'entidads/edit.js'
    end
  end

  def create
    @entidad = Entidad.new(params[:agency] || params[:entidad])
    if @entidad.save
      flash[:notice]="Entidad guardada!"
      # creo la cuenta para cada tipo de moneda
      if params[:another_one]
        redirect_to :action => 'new', :format =>'js'
      else
        redirect_to :action => 'show', :id => @entidad, :format =>'js'
      end

    else
      render 'entidads/new.js'
    end
  end

end
