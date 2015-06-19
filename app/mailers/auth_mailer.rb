class AuthMailer < ActionMailer::Base
  default :from => 'admin@devour.space'

  # send a signup email to the user, pass in the user object that
  # contains the user's email address
  def signup_email(user)
    @user = user
    mail(
      to: user.email,
      subject: 'Thanks for signing up'
    )
  end
end
