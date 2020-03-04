Rails.application.routes.draw do
  get 'clients/particuliers', to: 'clients#index_particulier'
  get 'clients/entreprises', to: 'clients#index_entreprise'
  post 'clients/particuliers', to: 'clients#create_particulier'
  post 'clients/entreprises', to: 'clients#create_entreprise'
  root 'accueil#index'

  resources :employes, :equipes, :clients, :contrat_clients, :type_services

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
