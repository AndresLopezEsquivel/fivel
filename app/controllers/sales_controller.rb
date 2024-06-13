class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update_status]
  before_action :authenticate_user!

  def show; end

  def new
    @sale = Sale.new
  end

  def create
    @service = Service.find(params[:service_id]) # Buscar el servicio asociado
    @sale = @service.sales.new(sale_params) # Crear nueva venta asociada al service
    @sale.user = current_user  # asignar el buyer (current_user) a la venta
    @service.user_id.current_user.email # who is the seller of the service

    if @sale.save
      redirect_to @sale, notice: 'Sale was succesfully created.'
    else
      flash.now[:alert] = 'Error creating sale'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update_status
    if @sale.update(status: params[:status])
      redirect_to pendings_path, notice: 'Sale was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def pendings
    @pending_purchases = Sale.where(status: 'pending', user: current_user)
    @pending_orders = Sale.where(status: 'pending', service: { user: current_user }).includes(:service)
  end

  private

  def sale_params
    params.require(:sale).permit(:status, :date, :price, :rating, :service_id)
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end
end
