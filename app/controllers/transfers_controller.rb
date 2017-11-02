class TransfersController < ApplicationController
  def new
    @transfer = Transfer.new source_id: params[:reserva_id]
  end

  def create
    @transfer = Transfer.new source_id: params[:reserva_id]
    if @transfer.update_attributes params[:transfer]
      redirect_to @transfer, notice: "El pase fue creado"
    else
      render :new
    end
  end

  def show
    @transfer = Transfer.find params[:id]
  end

  def destroy
    @transfer = Transfer.find params[:id]
    reserva = @transfer.depositos.first.reserva
    @transfer.destroy
    redirect_to reserva, notice: 'El pase fue eliminado'
  end
end
