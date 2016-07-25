class Contact < MailForm::Base
  attribute :subject,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  #hidden field - security against spam emails
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form",
      :to => "delejason@yahoo.com", #change address to the appropriate person for enquiries through the website
      :from => %("#{subject}" <#{email}>)
    }
  end
end