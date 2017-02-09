class NoticeMailer < ActionMailer::Base
  default from: 'te108186@gmial.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(customer, email)
    @customer = customer
    @email = email

    mail(to: email, subject: 'Traineyへ追加メールアドレスの確認')

  end
end
