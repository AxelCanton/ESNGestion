class Entreprise < Client

  #Validité des attributs
  validates :nomEntreprise, :numSiret, :nomReferent, presence: true
  validates :nomEntreprise, :nomReferent, length: {in: 2..30}
  validates :numSiret, length: {is: 14}
  validates :nomReferent, format: {with: /[a-zA-Z]+/i}
  validates :numSiret, format: {with: /[0-9]+/i}
end
