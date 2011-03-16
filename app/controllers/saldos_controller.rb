class SaldosController < InheritedResources::Base
  def index
    @saldos = Saldo.search(params[:search]).where(:entidad_id=>params[:entidad_id]).by_moneda_id(params[:moneda_id]).where("operadora_id = ? or operadora_id is NULL",params[:operadora_id])
    index!
  end
end

