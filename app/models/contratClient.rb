class ContratClient < ApplicationRecord
  #Concerne aucune ou plusieurs équipes
  has_many :travaillerSurs
  has_many :equipes, through: :travaillerSurs

  #Concerne aucuns ou plusieurs employés
  has_many :participes
  has_many :employes, through: :participes

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
