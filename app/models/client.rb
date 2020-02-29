class Client < ApplicationRecord
  #Un client a un ou plusieurs contrats
  has_many:contratClients

  #Validité des attributs
  validates :adresseC, :numTelC, :mailC, presence: true
  validates :numTelC, length: {is: 10}
  validates :numTelC, format: {with: /[0-9]+/i}
  validates :mailC, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  
end
