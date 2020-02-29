class Participe < ApplicationRecord
  belongs_to: contratClient
  belongs_to: employe
  belongs_to: mission

  validates :dateDebut, :dateFin, :participationEmployeTerminee, :role

  #Validité de employe et contrat client
  validates_associated :employe, :contratClient, :mission

  #Vérifie la validité des attributs
  validates :dateDebut, :dateFin, :role, :contratClient, :employe, presence : true
  validates :role, length: {in: 2..30}
end
