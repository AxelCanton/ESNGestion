class EquipesController < ApplicationController
  before_action :verif_admin
  def index
    @equipes=Equipe.all
  end

  def show
    @equipe=Equipe.find(params[:id])
    @employes=@equipe.employes.order("nome")
    @contratsActuels=TravaillerSur.find_by_sql(["SELECT \"nomLogiciel\",client_id FROM travailler_surs AS ts  INNER JOIN contrat_clients AS cs ON ts.contrat_client_id = cs.id WHERE \"participationTerminee\" = false AND equipe_id = ?", @equipe.id])
    @contratsAnciens=TravaillerSur.find_by_sql(["SELECT \"nomLogiciel\",client_id FROM travailler_surs AS ts INNER JOIN contrat_clients AS cs ON ts.contrat_client_id = cs.id WHERE \"participationTerminee\" = true AND equipe_id = ?", @equipe.id])

  end

  def new
    @equipe=Equipe.new
  end

  def edit
    @chef=Equipe.find(params[:id]).employe
    @equipe=Equipe.find(params[:id])

    #Liste des employés n'appartenant pas à une équipe
    @chefsDispo=Employe.where("equipe_id IS NULL").order("nome")


    #Liste des employés dispo n'apartenant pas à une autre équipe et n'étant pas chef d'une ou plusieurs équipes
    @employesDispo=Employe.where("(equipe_id IS NULL) AND employes.id NOT IN (SELECT equipes.employe_id FROM equipes WHERE employe_id IS NOT NULL)")

    #Liste des employés de l'équipe
    @employesEquipe=Employe.joins(:equipe).where("employes.equipe_id=?",@equipe.id).select("employes.id","nome","prenome").order("nome")

    #Liste des contrats auquels l'équipe particpe et l'id de la relation (pour pouvoir supprimer)
    @contrats=ContratClient.joins(:travailler_surs).where("travailler_surs.equipe_id = ? AND \"participationTerminee\"=false",@equipe.id).select("contrat_clients.*,travailler_surs.id as id_ts, equipe_id")

    #Liste des contrats non terminés auquels l'équipe ne participe pas
    @contratsDispo=ContratClient.left_outer_joins(:travailler_surs).where("termine=false AND contrat_clients.id NOT IN (SELECT contrat_client_id FROM travailler_surs WHERE equipe_id = ?)", @equipe.id).select("contrat_clients.*,travailler_surs.contrat_client_id,travailler_surs.equipe_id")
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

  #Ajoute un l'équipe à un contrat
  def add_contrat
    @idContrat=ajout_contrat['contrat']
    @idEquipe=params[:id]
    @equipe=Equipe.find(@idEquipe)
    @contrat=ContratClient.find(@idContrat)

    @relation=TravaillerSur.new(contrat_client_id: @idContrat, equipe_id: @idEquipe, participationTerminee: false)
    @relation.save
    redirect_to @equipe
  end



  #Supprime un employé de l'équipe
  def destroy_employe
    @employe=Employe.find(id_employe['emp_id'])
    @equipe=Equipe.find(params[:id])
    @equipe.employes.delete(@employe)
    redirect_to edit_equipe_path(@equipe)
  end

  #Met l'attribut participationTerminee de la relation à true
  def destroy_contrat
    param=supp_contrat
    @relation=TravaillerSur.find(param['id_ts'])
    @relation.participationTerminee=true
    @relation.save
    redirect_to Equipe.find(param['id_eq'])
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
    def ajout_contrat
      params.require(:contrat_client).permit(:contrat)
    end
    def supp_contrat
      params.require(:ts).permit(:id_ts, :id_eq)
      end
end
