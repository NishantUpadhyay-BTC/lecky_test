class ModelMailer < ActionMailer::Base
  default from: "demo4582@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_pin_notification(pin)
    @pin = pin
    mail to: pin.user.email, subject: "#{@pin.user.name}, your restaurant #{@pin.description} is added.", bcc: "oliviervanhees@gmail.com"
  end

  def new_like_notification(pin, follower, current_user)
    @pin = pin
    @follower = follower
    @current_user = current_user
    mail to: @follower.email, subject: "Your friend #{@follower.name}, likes the #{@pin.name}.", bcc: "oliviervanhees@gmail.com"
  end

  def new_follower_notification(user, current_user)
    @user = user
    @current_user = current_user
    mail to: user.email, subject: "#{@user.name}, you are now followed by #{current_user.name}.", bcc: "oliviervanhees@gmail.com"
  end

  def new_user_account_notification(user)
    @user = user
    mail to: @user.email, subject: "Welcome!!!.", bcc: "oliviervanhees@gmail.com"
  end

  def test_mail
    mail to: "nishantupadhyay26@gmail.com", subject: "Welcome!!!."
  end
end

