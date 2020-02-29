class Equipe < ApplicationRecord
  #FK du chef d'équipe
  belongs_to:employe

  #Contient aucun ou plusieurs employés
  has_and_belongs_to_many :employes

  #Travail sur aucun ou plusieurs projets
  has_many:travaillerSurs
  has_many:contratClients, through: :travaillerSurs

  #Verifie l'existance et la validité du chef d'équipe
  validates :employe, presence: true
  validates_associated :employe


end
