class RecMailer < ActionMailer::Base
  default from: "noreply@trekrecs.com"

  def newrec_email(user)
    @tripowner = user
    mail( :to => user.email,  :subject => 'You received a new recommendation on TrekRecs!')
  end

end
