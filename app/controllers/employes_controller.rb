class EmployesController < ApplicationController
  before_action :verif_admin, :except => [:show]
  before_action :verif_employe, :only => [:show]
  def index
    @employes=Employe.where("\"estAdmin\"=false")
  end

  def show
    #Pour patch
    @participe=Participe2.where("employe_id=? AND \"participationEmployeTerminee\"=false",params[:id])

    @employe=Employe.find(params[:id])
    @contratActuel=ContratClient.joins(:participe2s,:client).where("participe2s.\"participationEmployeTerminee\" = false AND participe2s.employe_id= ?", @employe.id).select("contrat_clients.*,participe2s.mission_id,clients.type,clients.\"nomP\",clients.\"prenomP\",clients.\"nomEntreprise\"")
    if !@contratActuel.empty?
      if !@contratActuel[0].mission_id.nil?
        @mission=Mission.find(@contratActuel[0].mission_id)
      end
    end
    @contratsAnciens=ContratClient.joins(:participe2s).where("participe2s.\"participationEmployeTerminee\" = true AND participe2s.employe_id= ?", @employe.id).select("contrat_clients.*,participe2s.\"dateFin\"")
  end

  def new
    @employe=Employe.new
  end

  def edit
    @employe=Employe.find(params[:id])
  end

  def create
    @employe=Employe.new(param_employe)

    mdp=[*('A'..'Z'),*('0'..'9')]
    mdp=mdp.shuffle[0,9].join
    @employe.encrypted_password=secure_hash(mdp)
    @employe.estAdmin=false
    @employe.estValide=false

    if @employe.save
      #Envoi d'un mail contenant le mdp au mail du nouvel employé (ne fonctionne pas)
      #EmployeMailer.with(email: @employe.email,mdp: mdp).nv_employe.deliver_now
      redirect_to @employe
    else
      render 'new'
    end
  end

    def update
      @employe = Employe.find(params[:id])

        if @employe.update(param_employe)
          redirect_to @employe
        else
          render 'edit'
        end
    end

    def destroy
      @employe = Employe.find(params[:id])
      @employe.destroy

      redirect_to employes_path
    end

    def ajout_contrat
      @relation = Participe2.new
      @employe=Employe.select("id,nome,prenome").find(params[:id])
      @contrats=ContratClient.joins(:client).where("termine=false").select("contrat_clients.*,clients.type, clients.\"nomP\", clients.\"prenomP\", clients.\"nomEntreprise\"")

    end

    def add_contrat
      #En cas d'erreur
      @employe=Employe.select("id,nome,prenome").find(params[:id])
      @contrats=ContratClient.joins(:client).where("termine=false").select("contrat_clients.*,clients.type, clients.\"nomP\", clients.\"prenomP\", clients.\"nomEntreprise\"")

      param=param_add_contrat
      @relation = Participe2.new
      @relation.role=param['role']
      @relation.dateDebut=param['dateDebut']
      @relation.contrat_client_id=param['contrat_client_id']
      @relation.employe_id=params[:id]
      @relation.participationEmployeTerminee=false
      if @relation.save
        redirect_to employe_path(@relation.employe_id)
      else
        render 'ajout_contrat'
      end
    end

    def ajout_mission
      @mission=Mission.new
      @relation=Participe2.new
      @employe=Employe.select("id,nome,prenome").find(params[:id])
      @contrats=ContratClient.joins(:client).where("termine=false").select("contrat_clients.*,clients.type, clients.\"nomP\", clients.\"prenomP\", clients.\"nomEntreprise\"")
    end

    def add_mission
      #En cas d'erreur
      @employe=Employe.find(params[:id])
      @contrats=ContratClient.joins(:client).where("termine=false").select("contrat_clients.*,clients.type, clients.\"nomP\", clients.\"prenomP\", clients.\"nomEntreprise\"")


      param=param_add_mission
      @mission=Mission.new
      @mission.adresseM=param['adresseM']
      if @mission.save
        @relation = Participe2.new
        @relation.participationEmployeTerminee=false
        @relation.mission_id=@mission.id
        @relation.role=param['role']
        @relation.dateDebut=param['dateDebut']
        @relation.contrat_client_id=param['contrat_client_id']
        @relation.employe_id=params[:id]
        if @relation.save
          redirect_to employe_path(@relation.employe_id)
        else
          render 'ajout_mission'
        end
      else
        render 'ajout_mission'
      end
    end

def participation_terminee
  @relation=Participe2.where("participe2s.\"participationEmployeTerminee\" = false AND participe2s.employe_id= ?", params[:id])
  @relation[0].participationEmployeTerminee=true
  @relation[0].dateFin=param_termine['dateFin']
  @relation[0].save
  redirect_to employe_path(@relation[0].employe_id)

end


  private
  #Vérifie les données envoyées par le formulaire
    def param_employe
      params.require(:employe).permit(:nome, :prenome, :ageE, :email, :numTelE, :formation, :adresseE, :nbAnneeExp, :intituleContrat, :salaireBrut, :dateDebutE, :dateFinE)
    end
    def param_add_contrat
      params.require(:participe).permit(:role,:contrat_client_id, :dateDebut)
    end
    def param_add_mission
      params.require(:participe).permit(:role,:contrat_client_id, :dateDebut, :adresseM)
    end
    def param_termine
      params.require(:participe2).permit(:dateFin)
    end

    #fct qui crypte le mdp
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

    #pour éviter qu'un employé puisse accéder à la page perso d'un autre employé
    def verif_employe
      id=Employe.find(params[:id]).id
      if @current_user.estAdmin!=true && @current_user.try(:id)!=id
        return head :forbidden
      end
    end

end
