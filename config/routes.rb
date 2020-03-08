Rails.application.routes.draw do

  #Gestion des relations employe/equipe et equipe/contrat
  patch 'equipes/:id/addEmploye', to: 'equipes#add_employe'
  patch 'equipes/:id/delEmploye', to: 'equipes#destroy_employe'
  patch 'equipes/:id/addChef', to: 'equipes#add_chef'
  patch 'equipes/:id/delContrat', to: 'equipes#destroy_contrat'
  patch 'equipes/:id/addContrat', to: 'equipes#add_contrat'

  #Gestion des relations contrat/employe
  get 'employes/:id/ajout_contrat', to: 'employes#ajout_contrat'
  post 'employes/:id/add_contrat', to: "employes#add_contrat"
  get 'employes/:id/ajout_mission', to: 'employes#ajout_mission'
  post 'employes/:id/add_mission', to: 'employes#add_mission'

  #Mettre fin à la participation d'un employe à un contrat
  patch 'employes/:id/termine', to: 'employes#participation_terminee'

  #Mettre fin à un contrat
  patch 'contrat_clients/:id/termine', to: 'contrat_clients#contrat_termine'



  #Afficher les particuliers
  get 'clients/particuliers', to: 'clients#index_particulier'
  #Afficher les entreprises
  get 'clients/entreprises', to: 'clients#index_entreprise'

  #Création client
  post 'clients/particuliers', to: 'clients#create_particulier'
  post 'clients/entreprises', to: 'clients#create_entreprise'

  get 'deconnection', to: 'sessions#destroy'
  get 'accueil', to: 'accueils#index'
  post '/sign_in', to: 'sessions#login'
  root 'accueils#connexion'

  resources :employes, :equipes, :clients, :contrat_clients, :type_services

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
