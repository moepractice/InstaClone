class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: @contact.user.email, subject: "つぶやきが確認できました！"
  end
end