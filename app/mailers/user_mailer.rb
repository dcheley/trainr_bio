class UserMailer < ApplicationMailer
  default from: 'trainrbio@gmail.com'
  layout 'mailer'

  def landing_email(comment)
    @comment = comment
    mail(to: "trainrbio@gmail.com", subject: "Someone sent a message from the landing page!!")
  end
end
