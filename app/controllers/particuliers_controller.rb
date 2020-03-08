class ParticuliersController < ApplicationController
def index
  @particuliers=Particulier.all
end
end
