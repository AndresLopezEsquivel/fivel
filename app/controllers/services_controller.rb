class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:search].present? && @service
      @services = Service.search_by_service(params[:search])
    else
      @services = Service.all
    end
  end

  def show
    @seller = @service.user
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.save
      redirect_to service_path(@service)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  def user_services
    @user_services = Service.where(user: current_user)
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :price, :category, :delivery_time, images: [])
  end
end
