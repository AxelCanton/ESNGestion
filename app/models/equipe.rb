class Equipe < ApplicationRecord
  #FK du chef d'équipe
  belongs_to:employe, optional: true

  #Contient aucun ou plusieurs employés
  has_many :employes

  #Travail sur aucun ou plusieurs projets
  has_many:travailler_surs
  has_many:contrat_clients, through: :travailler_surs



  validates :nomEquipe, presence: true

end
