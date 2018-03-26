class ContactMailer < ApplicationMailer
  def contact_mail(insta)
    @insta = insta
    mail to: @insta.user.email , subject: "つぶやきが確認できました！"
  end
end