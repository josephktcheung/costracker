module ItemHelper

  def best_seller(item)
    item.sellers.min { |a, b| a.today_price <=> b.today_price }
  end

  def desired_price(item, currency)
    item.desired_price.exchange_to(currency)
  end

  def today_price(seller,currency)
    seller.today_price.exchange_to(currency)
  end
end