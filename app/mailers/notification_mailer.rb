class NotificationMailer < ApplicationMailer
  # def welcome(user)
  #   mail(to: user.email, subject: "Welcome to our app!")
  # end
  def welcome
    mail(to: "huangz55@mcmaster.ca", subject: "Welcome to our app!")
  end
end
