class ContratClient < ApplicationRecord
  #Concerne aucune ou plusieurs équipes
  has_many:travaillerSurs
  has_many:equipes, through: :travaillerSurs

  #Concerne aucuns ou plusieurs employés
  has_many:participes
  has_many:employes, through: :participes

  #Concerne 1 ou plusieurs services
  has_and_belongs_to_many:typesServices

  #Un contrat est signé par un client
  belongs_to:client

  #Validité des attributs
  validates :nomLogiciel, :client, presence: true
  validates :nomLogiciel, length: {in: 2..30}

  #Validité du type de service
  validates_associated :typesServices
end
