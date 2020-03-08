class TypeServicesController < ApplicationController
  before_action :verif_admin
  def new
    @service=TypeService.new
  end

  def index
    @services=TypeService.all
  end

  def edit
    @service=TypeService.find(params[:id])
  end

  def update
    @service=TypeService.find(params[:id])
    if @service.update(param_service)
      redirect_to type_services_path
    else
      render 'edit'
    end
  end

  def create
    @service=TypeService.new(param_service)

    if @service.save
      redirect_to type_services_path
    else
      render 'new'
    end
  end

  def destroy
    @service=TypeService.find(params[:id])
    @service.destroy

    redirect_to type_services_path
  end

  private
    def param_service
      params.require(:type_service).permit(:libelleType)
    end
end
