every 1.minute do
  rake "seller:update_price_logs", environment: 'development'
end

every 1.day do
  rake "item:check_price", environment: 'development'
  rake "rate:get_today_rate", environment: 'development'
end
