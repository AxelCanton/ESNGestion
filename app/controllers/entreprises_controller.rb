class EntreprisesController < ApplicationController
  before_action :verif_admin
  def index
    @entreprises=Entreprise.all
  end

end
