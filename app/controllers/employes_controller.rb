class EmployesController < ApplicationController

  def index
    @employes=Employe.all
  end

  def show
    @employe=Employe.find(params[:id])
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
    @employe.mdp=mdp
    @employe.estAdmin=false
    @employe.estValide=false

    if @employe.save
      #Envoi d'un mail contenant le mdp au mail du nouvel employé
      EmployeMailer.with(employe: @employe).nv_employe.deliver_later
      redirect_to @employe
    else
      render 'new'
    end
  end

    def update
      @employe = Article.find(params[:id])

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



  private
  #Vérifie les données envoyées par le formulaire
    def param_employe
      params.require(:employe).permit(:nomE, :prenomE, :ageE, :mailE, :numTelE, :formation, :adresseE, :nbAnneeExp, :intituleContrat, :salaireBrut, :dateDebutE)
    end
end
