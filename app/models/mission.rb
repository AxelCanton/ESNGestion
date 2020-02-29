class Mission < ApplicationRecord
  has_one:participe

  #Vérifie la validité des attributs
  validates :adresseM, presence: true
end
