class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "yajima_moe@nexway.co.jp", subject: "お問い合わせの確認メール"
  end
end