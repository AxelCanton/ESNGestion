class TravaillerSur < ApplicationRecord
  #FK
  belongs_to :equipe
  belongs_to :contratClient

  #Vérifie la validité des attributs
  validates :participationTerminee, presence: true

  #Vérifie la validité des objets associés
  validates_associated :equipe, :contratClient
end
