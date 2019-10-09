class UserMailer < ActionMailer::Base
  default from: "ramananrpn@gmail.com"

  def welcome_email(account)
    @account = account
    mail(:to => "ramananrpn@gmail.com", :subject => "Account Successfully Created")
  end
end
