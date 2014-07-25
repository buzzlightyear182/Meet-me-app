class UserMailer < ActionMailer::Base
  default from: "janedee1021@gmail.com"

  def account_created(user)
  	@user = user
  	mail(to: user.email, subject: "Your account is created!")
  end
end
