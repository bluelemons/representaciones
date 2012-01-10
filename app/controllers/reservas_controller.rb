class ReservasController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :html, :xml, :js, :json
  def index
    @search = Reserva.with_includes.search(params[:search])
    @reservas = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        @reservas = @search
        output = ReservaReport.new.situacion_operadora(@reservas, params[:search])
        send_data output, :filename => "index_report.pdf",
                          :type => "application/pdf"
      end
      format.csv do
        csv = to_csv(@search)
        send_data csv, :filename => "reservas_#{Time.now}.csv",
                  :type => "text/csv; charset=utf-8; header=present"
      end
    end
  end

  def new
#    @reserva = Reserva.new
#    @reserva.build_monto
    @pasajero = Pasajero.new

    new!
  end

  def edit
    @pasajero = Pasajero.new
    edit!
  end

  def show
    @reserva.revert_to(params[:version].to_i) if params[:version]
    @total = Movimiento.total(@reserva.pagos)
    show!
  end

  def restore
    @reserva = Reserva.find(params[:id])
    @reserva.revert_to! params[:version_id]
    redirect_to :action => 'show', :id => @reserva
  end

  def update
    @reserva = Reserva.find(params[:id])
    @reserva.user = current_user
    if @reserva.update_attributes(params[:reserva])

      redirect_to :action => 'show', :id => @reserva, :format =>'js',:controller=>'reservas'
    else
      render 'reservas/edit.js'
    end
  end

  def create
    @reserva = Reserva.new(params[:reserva])
    @reserva.user = current_user
    if @reserva.save
      flash[:notice]="Reserva creada"
      redirect_to :action => 'show', :id => @reserva, :format =>'js'
    else
      @pasajero = Pasajero.new
      render 'new.js'
    end
  end

  private

  def to_csv(relation)
    require 'csv'

    CSV.generate(:col_sep => ";") do |csv|
      csv << %w[ id agencia operadora fecha salida referencia programa periodo regimen titular pasajeros seguro tarifa moneda ]
      relation.each do |r|
        csv << %W[ #{r.id} #{r.agencia.name} #{r.operadora.name} #{r.fecha} #{r.salida} #{r.referencia} #{r.programa.try(:name)} #{r.periodo} #{r.regimen} #{r.titular} #{r.pasajeros.size} #{r.seguro.try(:localize)} #{r.total} #{r.total_currency}]
      end
    end
  end
end

