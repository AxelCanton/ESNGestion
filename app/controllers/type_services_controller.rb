class TypeServicesController < ApplicationController
  before_action :verif_admin
  def new
    @service=TypeService.new
  end

  def index
    @services=TypeService.all
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
      params.require(:typeService).permit(:libelleType)
    end
end
