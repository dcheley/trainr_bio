module SendgridService
  module Email
    def send_email(body=nil, from, to, subject)
      from = SendGrid::Email.new(email: from)
      to = SendGrid::Email.new(email: to)
      content = SendGrid::Content.new(type: 'text/plain', value: body)
      mail = SendGrid::Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
    end
  end
end
