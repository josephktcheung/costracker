class UserNotifier < ActionMailer::Base

  default from: "WishGotCha <webmaster@wishgotcha.com>"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[WishGotCha] Reset your credentials"
  end

  def password_was_reset(user)
  end
end