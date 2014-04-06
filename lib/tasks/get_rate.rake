namespace :rate do
  desc "Get currency rate"
  task :get_today_rate => :environment do
    rates_source = 'http://openexchangerates.org/latest.json'
    rates_source << "?app_id=#{ENV['OPENEXCHANGERATES_APP_ID']}" if ENV['OPENEXCHANGERATES_APP_ID']
    doc = Yajl::Parser.parse(open(rates_source).read)
    Rate.create(rate: doc['rates'], date: Date.today)
    bank = Money.default_bank
    base_currency = 'USD'
    doc['rates'].each do |currency, rate|
      bank.set_rate(Date.today, base_currency, currency, rate)
    end
  end
end