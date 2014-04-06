object @item
attributes :name

child :sellers do
  attributes :name

  child :price_logs, object_root:false do
    attributes :date
    node(:price) do |price_log|
      @bank.exchange_with(price_log.date, price_log.price, @fav_currency).dollars
    end
  end

end

node(:fav_currency) { @fav_currency }