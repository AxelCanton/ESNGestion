class ContratClient < ApplicationRecord
  #Concerne aucune ou plusieurs équipes
  has_many :travailler_surs
  has_many :equipes, through: :travailler_surs

  #Concerne aucuns ou plusieurs employés
  has_many :participe2s
  has_many :employes, through: :participe2s

  #Un contrat est signé par un client
  belongs_to :client

  #Un contrat possède un type de service
  belongs_to :type_service

  #Validité des attributs
  validates :nomLogiciel, :client, :type_service, presence: true
  validates :nomLogiciel, length: {in: 2..30}

  #Validité du type de service
  validates_associated :type_service
end
