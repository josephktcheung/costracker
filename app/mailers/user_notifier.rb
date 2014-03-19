class UserNotifier < ActionMailer::Base
  LINK_TO_RESET = "[WishGotCha] Reset your credentials"
  WAS_RESET = "[WishGotCha] Password was reset"

  default from: "WishGotCha <webmaster@wishgotcha.com>"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: LINK_TO_RESET
  end

  def password_was_reset(user)
    @user = user
    mail to: @user.email, subject: WAS_RESET
  end
end