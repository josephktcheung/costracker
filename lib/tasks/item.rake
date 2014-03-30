require "#{Rails.root}/app/helpers/item_helper"
require 'pry'
include ItemHelper

namespace :item do
  desc "Check price"
  task :check_price => :environment do
    Item.all.entries.each do |item|
      best_seller = best_seller(item)
      if best_seller.today_price < item.desired_price
        ItemNotifier.notify_bargain(item, best_seller).deliver
      end
    end
  end
end