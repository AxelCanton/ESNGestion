class ClientsController < ApplicationController
  def index
    
  end

  def show
    @client=Client.find(params[:id])
  end

  def new
    @entreprise=Entreprise.new
    @particulier=Particulier.new
  end

  def edit

  end

  def create_entreprise
    @entreprise=Client.new(param_entreprise)
    @entreprise.type='Entreprise';
      if @entreprise.save
        redirect_to @entreprise
      else
        render 'new'
      end
  end

  def create_particulier
    @particulier=Client.new(param_particulier)
    @particulier.type='Particulier'
      if @particulier.save
        redirect_to @particulier
      else
        render 'new'
      end
  end

  def show_entreprise
    @entreprises=Entreprise.all
  end

  def show_particulier
    @particuliers=Particulier.all
    render :template => "clients/particuliers/index.html.erb"
  end

  def update

  end

  def destroy

  end


  private
    def param_particulier
      params.require(:particulier).permit(:nomP, :prenomP, :adresseC, :mailC, :numTelC)
    end
    def param_entreprise
      params.require(:entreprise).permit(:nomEntreprise, :numSiret, :adresseC, :mailC, :numTelC, :nomReferent)
    end
end
