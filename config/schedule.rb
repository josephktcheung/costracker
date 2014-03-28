every 1.minute do
  rake "seller:update_price_logs", environment: 'development'
end
