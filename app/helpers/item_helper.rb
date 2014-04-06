module ItemHelper



  def desired_price(item, currency)
    item.desired_price.exchange_to(currency)
  end

  def today_price_in_fav_currency(seller,currency)
    seller.today_price.exchange_to(currency)
  end
end