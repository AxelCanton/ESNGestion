class Employe < ApplicationRecord


  #Dirige 0 ou plusieurs équipe
  has_many:equipes

  #Appartient à une équipe (ou aucune)
  belongs_to:equipe, optional: true

  #Travaille sur aucun ou plusieurs contrats
  has_many:participes
  has_many:contratClients, through: :participes

  #Vérifie la validité des attributs
  validates :nome, :prenome, :mailE, :adresseE, :numTelE, :formation, :nbAnneeExp, :intituleContrat, :salaireBrut, :mdp, :ageE, :dateDebutE, presence: true
  validates :nome, :prenome, :intituleContrat, :salaireBrut, length: {in: 2..60}
  validates :mdp, length: {in: 7..30}
  validates :numTelE, length: {is: 10}
  validates :mailE, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :prenome, :nome, format: {with: /[a-zA-Z]+/i}
  validates :numTelE, :nbAnneeExp, :salaireBrut, format: {with: /[0-9]+/i}
end
