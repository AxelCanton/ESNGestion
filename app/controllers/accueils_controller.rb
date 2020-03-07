class AccueilsController < ApplicationController
  skip_before_action :current_user, :only => [:connexion]
  before_action :verif_admin, :only => [:index]


  def connexion

  end


  def index

  end



end
