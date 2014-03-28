namespace :seller do
  desc "Update price logs"
  task :update_price_logs => :environment do
    Seller.all.entries.each do |seller|
      seller.scrape
      seller.create_price_log if seller.temp_price
    end
  end
end