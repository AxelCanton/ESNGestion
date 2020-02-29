class Bdd < ActiveRecord::Migration[6.0]
  def change

    #Creation de la table Employes
    create_table :employes do |t|
      t.string :nomE
      t.string :prenomE
      t.string :mailE
      t.numeric :ageE
      t.string :adresseE
      t.string :numTelE
      t.string :formation
      t.datetime :dateDebutE
      t.datetime :dateFinE
      t.numeric :nbAnneeExp
      t.string :intituleContrat
      t.numeric :salaireBrut
      t.string :mdp
      t.boolean :estAdmin
      t.boolean :estValide
    end

    #Creation de la relation entre Employes,ContratClients,Missions
    create_table :participes do |t|
      t.datetime :dateDebut
      t.datetime :dateFin
      t.boolean :participationEmployeTerminee
      t.string :role
      t.belongs_to :employe
      t.belongs_to :contratClient
      t.belongs_to :missions
    end

    #Creation de la table Missions
    create_table :missions do |t|
      t.string :adresseM
    end

    #Creation de la table Equipes
    create_table :equipes do |t|
      t.belongs_to :employe
    end

    #Creation de la relation entre Equipes et Employes (sans id)
    create_table :equipes_employes, id:false do |t|
      t.belongs_to :equipe
      t.belongs_to :employe
    end

    #Creation de la relation entre Equipes et ContratClients
    create_table :travaillerSurs do |t|
      t.belongs_to :equipe
      t.belongs_to :contratClient
      t.boolean :participationTerminee
    end

    #Creation de la table ContratClients
    create_table :contratClients do |t|
      t.string :nomLogiciel
      t.belongs_to :client
    end

    #Creation de la table TypeServices
    create_table :typesServices do |t|
      t.string:libelleType
    end

    #Creation de la relation entre TypeServices et ContratClients (sans id)
    create_table :typesServices_contratClients, id:false do |t|
      t.belongs_to :typeService
      t.belongs_to :contratClient
    end

    #Creation de la table Clients
    create_table :clients do |t|
      t.string :type
      t.string :adresseC
      t.string :numTelC
      t.string :mailC
      t.string :nomP
      t.string :prenomP
      t.string :nomEntreprise
      t.string :numSiret
      t.string :nomReferent
    end


  end
end
