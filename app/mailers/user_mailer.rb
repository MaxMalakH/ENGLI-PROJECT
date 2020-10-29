class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.you_liked.subject
  #
  def you_liked(email)

    mail to: email, subject: "You liked 5 times!"

  end
end
