class EmployeMailer < ApplicationMailer

  def nv_employe

    @mdp=params[:mdp]

    #URL vers page de connection
    @url="https://peaceful-wave-40701.herokuapp.com/"
    mail(to: params['email'], subject: 'Compte ESNGestion créé')
  end

end
