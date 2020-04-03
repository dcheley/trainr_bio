class CustomMailer < Devise::Mailer
  default template_path: 'devise/mailer'

  # Overriding Devise confirmation instructions method.
  def confirmation_instructions(record, token, opts={})
    @user = record
    @token = token

    SendGridService::Email.new(
      'trainrbio@gmail.com',
      @user.email,
      "Click the confirmation link to verify your Trainrbio account.",
      'text/plain',
      "https://www.trainr.bio/users/confirmation?confirmation_token=#{@token}"
    ).send_email
    # super
  end

  def reset_password_instructions(record, token, opts={})
    @user = record
    @token = token

    SendgridService::Email.new(
      'trainrbio@gmail.com',
      @user.email,
      "Click the link to reset your Trainrbio password.",
      'text/plain',
      "https://www.trainr.bio/users/password/edit?reset_password_token=#{@token}"
    ).send_email
    # super
  end
end
