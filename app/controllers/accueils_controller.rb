class AccueilsController < ApplicationController
  skip_before_action :current_user, :only => [:connexion]
  before_action :verif_admin, :only => [:index]


  def connexion
    render layout: "connexion"
  end


  def index

  end



end
