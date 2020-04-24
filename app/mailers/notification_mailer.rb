class NotificationMailer < ApplicationMailer
  # def welcome(user)
  #   mail(to: user.email, subject: "Welcome to our app!")
  # end
  # def welcome
  #   mail(to: "huangz55@mcmaster.ca", subject: "Welcome to our app!")
  # end
  #default :from => 'any_from_address@example.com'
  default :from => ''
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_signup_email(user)
      @user = user
      mail( :to => @user.email,
      :subject => 'Thanks for signing up for our amazing app' )
    end
end
