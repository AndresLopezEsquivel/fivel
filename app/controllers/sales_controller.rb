class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update_status]
  before_action :authenticate_user!

  def show; end

  def new
    @sale = Sale.new
  end

  def create
    @service = Service.find(params[:service_id])
    @sale = @service.sales.new(sale_params)
    @sale.assign_buyer(current_user)

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
    @pending_orders = Sale.where(status: 'pending', service_id: current_user.services.ids)
  end

  private

  def sale_params
    params.require(:sale).permit(:status, :date, :price, :rating, :service_id)
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end
end
