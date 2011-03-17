class AgenciasController < InheritedResources::Base

  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Agencia.search(params[:search])
    else
      @search = Agencia.baja.search()
    end
      @entidads = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        output = AgenciaReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end

  end

  def show
    @entidad = Agencia.find(params[:id])
    @entidad.revert_to(params[:version].to_i) if params[:version]
    render "entidads/show"
  end

  def restore
    @agencia = Agencia.find(params[:id])
    @agencia.revert_to! params[:version_id]
	  redirect_to :action => 'entidads/show', :id => @agencia
  end

  def update
    @agencia = Agencia.find(params[:id])
    @agencia.user = current_user
    if @agencia.update_attributes(params[:agencia])
      redirect_to :action => 'entidads/show', :id => @agencia, :format =>'js'
    else
      render 'entidads/edit.js'
    end
  end

  def new
    @entidad = Agencia.new
    render "entidads/new.js"
  end

  def create
    @agencia = Agencia.new(params[:agencia])
    @agencia.user = current_user
    if @agencia.save

      if params[:another_one]
        redirect_to :action => 'entidads/new', :format =>'js'
      else
        redirect_to :action => 'entidads/show', :id => @agencia, :format =>'js'
      end
    else
      render 'entidads/new.js'
    end
  end

end

