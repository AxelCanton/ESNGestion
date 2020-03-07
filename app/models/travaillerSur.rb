class TravaillerSur < ApplicationRecord
  #FK
  belongs_to :equipe
  belongs_to :contrat_client


  #Vérifie la validité des objets associés
  validates_associated :equipe, :contrat_client
end
