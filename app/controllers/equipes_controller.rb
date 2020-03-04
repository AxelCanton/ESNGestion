class EquipesController < ApplicationController
  def index
    @equipes=Equipe.all
  end

  def show
    @equipe=Equipe.find(params[:id])
    @employes=@equipe.employes
  end
  def new
    @equipe=Equipe.new
  end

  def edit
    @equipe=Equipe.find(params[:id])
  end

  def create
    @equipe=Equipe.new(param_equipe)
    @equipe.employe=Employe.new
    if @equipe.save
      redirect_to @equipe
    else
      render 'new'
    end
  end

  def update

  end

  def destroy

  end

  private
    def param_equipe
      params.require(:equipe).permit(:nomEquipe)
    end
end
