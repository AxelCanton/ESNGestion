class SessionsController < ApplicationController



  #Sign in
  def login
    param=param_connexion
    employe=Employe.where(email: param['email']).first
    if employe.nil?
      @error="email"
      render :template => "accueils/connexion.html.erb"
    elsif employe.encrypted_password != secure_hash(param['password'])
      @error="mdp"
      render :template => "accueils/connexion.html.erb"
    else
      session[:user_id]=employe.id
      if employe.estAdmin
        redirect_to "/accueil"
      else
        redirect_to employe
      end
    end

  end


  #Sign out
  def destroy

  end

  private

  def param_connexion
    params.require(:employe).permit(:email,:password)
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
