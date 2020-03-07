class Participe2 < ApplicationRecord
  belongs_to :contrat_client
  belongs_to :employe
  belongs_to :mission, optional: true


  #Validité de employe et contrat client
  validates_associated :employe, :contrat_client, :mission

  #Vérifie la validité des attributs
  validates :dateDebut, :role, :contrat_client, :employe, presence: true
  validates :role, length: {in: 2..30}
end
