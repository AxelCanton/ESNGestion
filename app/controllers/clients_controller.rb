class ClientsController < ApplicationController
  before_action :verif_admin

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
    @client=Client.find(params[:id])
    if @client.type == 'Entreprise'
      @entreprise=Entreprise.find(params[:id])
      render :template => "clients/entreprises/edit_entreprise.html.erb"
    else
      @particulier=Particulier.find(params[:id])
      render :template => "clients/particuliers/edit_particulier.html.erb"
    end
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

  def index_entreprise
    @entreprises=Entreprise.all
    render :template => "clients/entreprises/index.html.erb"
  end

  def index_particulier
    @particuliers=Particulier.all
    render :template => "clients/particuliers/index.html.erb"
  end

  def update
    @client = Client.find(params[:id])
    if @client.type == 'Entreprise'
      param=param_entreprise
      edit='entreprises/edit_entreprise'
    else
      param=param_particulier
      edit='particuliers/edit_particulier'
    end

    if @client.update(param)
      redirect_to client_path
    else
      render edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    if @client.type == 'Entreprise'
      redirect = 0
    else
      redirect = 1
    end
    @client.destroy

    if redirect == 0
      redirect_to clients_entreprises_path
    else
      redirect_to clients_particuliers_path
    end
  end


  private
    def param_particulier
      params.require(:particulier).permit(:nomP, :prenomP, :adresseC, :mailC, :numTelC)
    end
    def param_entreprise
      params.require(:entreprise).permit(:nomEntreprise, :numSiret, :adresseC, :mailC, :numTelC, :nomReferent)
    end
end
