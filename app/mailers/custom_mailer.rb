class CustomMailer < Devise::Mailer
  require 'sendgrid-ruby'
  include SendGrid
  default template_path: 'devise/mailer'

  # Overriding Devise confirmation instructions method.
  def confirmation_instructions(record, token, opts={})
    # @user = record
    # @token = token
    #
    # from = SendGrid::Email.new(email: 'trainrbio@gmail.com')
    # to = SendGrid::Email.new(email: @user.email)
    # subject = "Click the confirmation link to verify your Trainrbio account."
    # content = SendGrid::Content.new(type: 'text/plain', value: "https://www.trainr.bio/users/confirmation?confirmation_token=#{@token}")
    # mail = SendGrid::Mail.new(from, subject, to, content)
    #
    # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    # response = sg.client.mail._('send').post(request_body: mail.to_json)
    super
  end
end
