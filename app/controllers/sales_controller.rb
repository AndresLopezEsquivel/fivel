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
    redirect_to root_path, notice: 'Product was successfully saved.'
  end

  def edit; end

  def update_status
    if @sale.update(status: params[:status])
      redirect_to pending_sales_path, notice: 'Status was successfully updated.'
    else
      redirect_to pending_sales_path, alert: 'Failed to update status.'
    end
  end

  def my_orders
    @my_orders = current_user.sales
  end

  def show_pending_sales
    # @pending_sales = []
    # current_user.services.each do |service|
    #   service.sales.each do |sale|
    #     @pending_sales << sale if sale.status == "pending"
    #   end
    # end
    @pending_sales = Sale.joins(:service).where(services: { user_id: current_user.id }, sales: { status: "pending" })
  end

  private

  def sale_params
    params.require(:sale).permit(:status, :date, :price, :rating, :service_id)
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end
end
