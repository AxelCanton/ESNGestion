class Employe < ApplicationRecord
  #Dirige 0 ou plusieurs équipe
  has_many:equipes

  #Appartient à une ou plusieurs équipes
  has_and_belongs_to_many:equipes

  #Travaille sur aucun ou plusieurs contrats
  has_many:participes
  has_many:contratClients, through: :participes

  #Vérifie la validité des attributs
  validates :nomE, :prenomE, :mailE, :adresseE, :numTelE, :formation, :nbAnneeExp, :intituleContrat, :salaireBrut, :mdp, :ageE, :dateDebutE, presence: true
  validates :nomE, :prenomE, :intituleContrat, :salaireBrut, length: {in: 2..60}
  validates :mdp, length: {in: 7..30}
  validates :numTelE, length: {is: 10}
  validates :mailE, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :prenomE, :nomE, format: {with: /[a-zA-Z]+/i}
  validates :numTelE, :nbAnneeExp, :salaireBrut, format: {with: /[0-9]+/i}
end
