class TypeService < ApplicationRecord
  #Les services sont proposées pour plusieurs contrats
  has_and_belongs_to_many:contratClients

  #Validité des attributs
  validates :libelleType, presence: true
end
