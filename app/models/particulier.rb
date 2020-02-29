class Particulier < Client

  #Validité des attributs
  validates :nomP, :prenomP, presence: true
  validates :nomP, :prenomP, length: {in: 2..30}
  validates :nomP, :prenomP, format: {with: /[a-zA-Z]+/i}
end
