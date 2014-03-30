class ItemNotifier < ActionMailer::Base
  BARGAIN = "[WishGotCha] You got a deal!"

  default from: "WishGotCha <webmaster@wishgotcha.com>"

  def notify_bargain(item, seller)
    @item = item
    @user = @item.user
    @seller = seller
    mail to: @user.email, subject: BARGAIN
  end

end