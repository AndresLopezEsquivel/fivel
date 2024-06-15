class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update_status]
  before_action :authenticate_user!

  def show; end

  def new
    @sale = Sale.new
  end

  def create
    @service = Service.find(params[:service_id])
    @sale = Sale.create!(status: "pending", date: Date.today, price: @service.price, user: current_user, service: @service)
    redirect_to root_path, notice: 'Product was succesfully saved.'
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
    @pending_purchases = Sale.where(status: 'pending')
  end

  def my_orders
    @my_orders = current_user.sales
  end

  private

  def sale_params
    params.require(:sale).permit(:status, :date, :price, :rating, :service_id)
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end
end
