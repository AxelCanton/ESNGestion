class EmployeMailer < ApplicationMailer

  def nv_employe

    @mdp=params[:mdp]

    #URL vers page de connection
    @url="https://peaceful-wave-40701.herokuapp.com/"
    mail(to: params['email'], subject: 'Compte ESNGestion créé')
  end
  def test
    :subject => "hello",
    :to  => "axelcanton01@gmail.com",
    :from => axel.canton@etu.umontpellier.fr,
    :html_body => "<strong>Hello</strong> dear Postmark user.",
    :track_opens => "true")
  end
end
