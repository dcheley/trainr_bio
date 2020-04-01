class SendGridService::Email
  require 'sendgrid-ruby'
  include SendGrid

  def initialize(from, to, subject, content_type, content_value=nil, body=nil)
    @body = body
    @from = from
    @to = to
    @subject = subject
    @content_type = content_type
    @content_value = content_value
  end

  def send_email
    sg_from = (SendGrid::Email.new(email: @from)).to_str
    sg_to = (SendGrid::Email.new(email: @to)).to_str

    content = SendGrid::Content.new(type: @content_type, value: @body)

    mail = SendGrid::Mail.new(sg_from, @subject, sg_to, @content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
