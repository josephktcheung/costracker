object @item
attributes :name

child :sellers do
  attributes :name

  child :price_logs do
    attributes :date
    node(:price) { |price_log| price_log.price.exchange_to(@fav_currency).dollars }
  end

end

node(:fav_currency) { @fav_currency }