class EquipesController < ApplicationController
  def index
    @equipes=Equipe.all
  end

  def show
    @equipe=Equipe.find(params[:id])
    @employes=@equipe.employes.order("nome")
  end
  def new
    @equipe=Equipe.new
  end

  def edit
    @chef=Equipe.find(params[:id]).employe
    @equipe=Equipe.find(params[:id])
    @employesDispo=Employe.where("equipe_id IS NULL").order("nome")
    @employesEquipe=Employe.find_by_sql("SELECT employes.id,equipes.employe_id,nome,prenome FROM employes INNER JOIN equipes ON employes.equipe_id=equipes.id AND equipes.id = ? ",@equipe.id)

  end

  def create
    @equipe=Equipe.new(param_equipe)
    if @equipe.save
      redirect_to equipe_path(@equipe.id)
    else
      render 'new'
    end
  end

  def update

  end


  def destroy
    @equipe = Equipe.find(params[:id])
    @equipe.destroy

    redirect_to equipes_path
  end

  #Ajout d'un employé
  def add_employe
    idEmploye=id_employe
    @equipe=Equipe.find(params[:id])
    @employe=Employe.find(idEmploye['emp_id'])
    @equipe.employes << @employe
    redirect_to edit_equipe_path(@equipe)
  end


  #Ajout d'un chef d'équipe
  def add_chef
    @equipe=Equipe.find(params[:id])
    if @equipe.update(update_chef)
      redirect_to edit_equipe_path(@equipe)
    else
      render 'edit'
    end

  end

  #Supprime un employé de l'équipe
  def destroy_employe
    @employe=Employe.find(id_employe['emp_id'])
    @equipe=Equipe.find(params[:id])
    @equipe.employes.delete(@employe)
    redirect_to edit_equipe_path(@equipe)

  end

  private
    def param_equipe
      params.require(:equipe).permit(:nomEquipe)
    end
    def id_employe
      params.require(:equipe).permit(:emp_id)
    end
    def update_chef
        params.require(:equipe).permit(:employe_id)
    end
end
