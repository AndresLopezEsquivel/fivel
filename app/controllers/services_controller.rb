class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @services = Services.all
  end

  def show; end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to service_path(@service)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @service.update
      redirect_to service_path(@service)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :price, :category, :delivery_time)
  end
end
