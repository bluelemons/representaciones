class BouchersController < InheritedResources::Base
  respond_to :html, :xml, :js, :json
  def index

    if params[:sin_boucher]
      r = Reserva.sin_boucher
    else
      r = Reserva
    end

    if params[:search]
      @search = r.search(params[:search])
    else
      @search = r.baja.search()
    end

    @reservas = @search
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        output = BoucherReport.new.to_pdf(@search,params[:search])
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end
  end

  def cargar
    @reserva = Reserva.find(params[:id])
    @reserva.boucher = params[:boucher]
    @reserva.save
  end

  def bajar
    @reserva = Reserva.find(params[:id])
    @reserva.boucher = nil
    @reserva.save
  end

end

