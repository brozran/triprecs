class UserMailer < ActionMailer::Base
  default from: "noreply@trekrecs.com"

  def signup_email(user)
    @user = user
    mail( :to => user.email,  :subject => 'Welcome to TrekRecs!' )
  end

end
