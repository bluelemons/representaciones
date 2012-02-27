class ThabitacionsController < InheritedResources::Base

  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Thabitacion.search(params[:search])
    else
      @search = Thabitacion.baja.search()
    end
      @thabitacions = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        output = ThabitacionReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end

  end

  def show
    @thabitacion = Thabitacion.find(params[:id])
    @thabitacion.revert_to(params[:version].to_i) if params[:version]
    show!
  end

  def update
    @thabitacion = Thabitacion.find(params[:id])
    if @thabitacion.update_attributes(params[:thabitacion])
      redirect_to :action => 'show', :id => @thabitacion, :format =>'js'
    else
      render 'edit.js'
    end
  end

  def create
    @thabitacion = Thabitacion.new(params[:thabitacion])
    if @thabitacion.save

      if params[:another_one]
        redirect_to :action => 'new', :format =>'js'
      else
        redirect_to :action => 'show', :id => @thabitacion, :format =>'js'
      end
    else
      render 'new.js'
    end
  end

end
