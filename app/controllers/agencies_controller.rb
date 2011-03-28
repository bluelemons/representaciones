class AgenciesController < EntidadsController

  respond_to :html, :xml,:js
  def index
    if params[:search]
      @search = Agency.search(params[:search])
    else
      @search = Agency.baja.search()
    end
    @entidads = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js{render "entidads/index"}
      format.html
      format.pdf do
        output = AgencyReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end

  end

  def new
    @entidad = Entidad.new(:type=>"Agency")
    render "entidads/new.js"
  end

end

