Rails.application.routes.draw do
  get 'clients/particuliers', to: 'clients#show_particulier'
  get 'clients/entreprises', to: 'clients#show_entreprise'
  resources :employes, :equipes, :clients, :contrat_clients
  post 'clients/particuliers', to: 'clients#create_particulier'
  post 'clients/entreprises', to: 'clients#create_entreprise'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
