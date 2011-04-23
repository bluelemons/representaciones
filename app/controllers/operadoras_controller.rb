class OperadorasController < EntidadsController

  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Operadora.search(params[:search])
    else
      @search = Operadora.baja.search()
    end
    @entidads = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js{render "entidads/index"}
      format.html
      format.pdf do
        output = EntidadReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end

  end

  def new
    @entidad = Entidad.new(:type=>"Operadora")
    render "entidads/new.js"
  end

end

