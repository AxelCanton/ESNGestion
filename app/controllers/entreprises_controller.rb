class EntreprisesController < ApplicationController
  def index
    @entreprise=Entreprise.all
  end

end
