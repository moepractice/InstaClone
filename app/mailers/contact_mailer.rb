class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "sillber426.trs2@i.softbank.jp", subject: "つぶやきが確認できました！"
  end
end