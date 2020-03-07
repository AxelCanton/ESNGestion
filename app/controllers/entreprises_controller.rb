class EntreprisesController < ApplicationController
  before_action :verif_admin
  def index
    @entreprise=Entreprise.all
  end

end
