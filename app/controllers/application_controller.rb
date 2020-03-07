class ApplicationController < ActionController::Base
  before_action :current_user

  private
    def verif_admin
      if @current_user.try(:estAdmin) != true
        return head :forbidden
      end
    end

    def current_user
      if session[:user_id]
        @current_user = Employe.find(session[:user_id])
      end
    end
end
