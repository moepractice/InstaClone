class ContactMailer < ApplicationMailer
  def contact_mail(blog)
    @blog = blog
    mail to: @blog.user.email , subject: "つぶやきが確認できました！"
  end
end