class EmployeMailer < ApplicationMailer

  def nv_employe
    @employe = params[:employe]

    #URL vers page de connection
    @url=""
    mail(to: @employe.emailE, subject: 'Compte ESNGestion créé')
  end
end
