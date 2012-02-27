class VencidasController < InheritedResources::Base
  respond_to :html, :xml, :js, :json
  def index
    r = Reserva.where("pago_minimo>0")
    if params[:search]
      @search = r.search(params[:search])
    else
      @search = r.search()
    end

    #quita del array las reservas que tienen pagos mayores a pago_minimo
    @search.all.delete_if do |x|
      (x.pago_minimo <= x.agencia_pago)
    end

    @reservas = @search
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        output = ReservaReport.new.regular(@search,params[:search])
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end
  end
end
