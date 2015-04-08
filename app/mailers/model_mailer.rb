class ModelMailer < ActionMailer::Base
  default from: "no-reply@email.altijdheerlijk.nl"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_pin_notification(pin)
    @pin = pin
    mail to: pin.user.email, subject: "#{@pin.user.name}, your restaurant #{@pin.description} is added.", bcc: "oliviervanhees@gmail.com"
  end

  def new_like_notification(pin)
    @pin = pin
    @user = pin.user
    mail to: pin.user.email, subject: "#{@pin.user.name}, your restaurant #{@pin.description} is now liked by others.", bcc: "oliviervanhees@gmail.com"
  end

  def new_follow_notification(user)
    @user = user
    mail to: user.email, subject: "#{@user.name}, you are now followd by others.", bcc: "oliviervanhees@gmail.com"
  end

end

