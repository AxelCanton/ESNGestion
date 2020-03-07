class ContratClientsController < ApplicationController
  before_action :verif_admin

    def index
      @contrats=ContratClient.where("termine=false")
      @contratParticulier=Array.new
      @contratEntreprise=Array.new
      @contrats.each do |c|
        if c.client.type == 'Entreprise'
          @contratEntreprise.push(c)
        else
          @contratParticulier.push(c)
        end
      end

      @contratsTermines=ContratClient.where("termine=true")
    end

    def show
      @contrat=ContratClient.find(params[:id])
      @client=@contrat.client
      @equipes=Equipe.find_by_sql(["SELECT eq.id,eq.\"nomEquipe\" FROM equipes as eq INNER JOIN travailler_surs as ts ON ts.equipe_id = eq.id WHERE ts.contrat_client_id = ? AND ts.\"participationTerminee\"=false", @contrat.id])
      if @client.type=='Entreprise'
        @name=@client.nomEntreprise
      else
        @name=@client.nomP.to_s+" "+@client.prenomP.to_s
      end
    end

    def new
      @contrat=ContratClient.new
      @listeClient=Client.all
      @listeService=TypeService.all
    end

    def edit
      @contrat=ContratClient.find(params[:id])
    end

    def create
      @param=param_contrat  #Tableau avec l'id du client, l'id du service, le nom et le prix
      @client=Client.find(@param['client'])
      @service=TypeService.find(@param['typeService'])
      @contrat=ContratClient.new(nomLogiciel: @param['nomLogiciel'], prixContrat: @param['prixContrat'])
      @contrat.client=@client
      @contrat.termine=false

       @contrat.type_service=@service
       if @contrat.save
         redirect_to @contrat
       else
         render 'new'
       end
    end

      def update
        @contrat = ContratClient.find(params[:id])

          if @contrat.update(param_contrat)
            redirect_to @contrat
          else
            render 'edit'
          end
      end

      def destroy
        @contrat = ContratClient.find(params[:id])
        @contrat.destroy

        redirect_to contrat_clients_path
      end

      def contrat_termine
        @contrat=ContratClient.find(params[:id])
        @employes=Participe2.where("contrat_client_id = ? AND \"participationEmployeTerminee\" = false", @contrat.id)
        @employes.each do |emp|
          emp.participationEmployeTerminee=true
        end
        @contrat.termine=true
        @contrat.save
        redirect_to contrat_clients_path
      end


    private
    #Vérifie les données envoyées par le formulaire
      def param_contrat
        params.require(:contratClient).permit(:client, :prixContrat, :nomLogiciel, :typeService)
      end

end
