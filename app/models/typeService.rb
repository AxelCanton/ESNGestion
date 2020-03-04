class TypeService < ApplicationRecord
  #Les services sont proposées pour plusieurs contrats
  has_many :contrat_clients

  #Validité des attributs
  validates :libelleType, presence: true
end
