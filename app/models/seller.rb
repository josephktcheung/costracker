class Seller
  require 'nokogiri'
  require 'open-uri'
  require 'bigdecimal'

  include Mongoid::Document
  include Mongoid::Timestamps

  ACCEPTED_CURRENCIES = [:hkd, :usd, :eur, :gbp, :cad, :jpy]

  attr_accessor :temp_price

  field :name, type: String
  field :url, type: String
  field :currency, type: String
  field :price_tag, type: String
  field :stock_tag, type: String
  field :stock, type: Integer

  belongs_to :item
  has_many :price_logs

  before_save :scrape
  before_save :create_price_log

  def create_price_log
    if self.price_logs.find_by(date: Date.today).nil?
      price_log = self.price_logs.build
    else
      price_log = self.price_logs.find_by(date: Date.today)
    end
    unless self.temp_price.nil?
      price_log.price = Money.new(self.temp_price, self.currency)
      price_log.date = Date.today
      price_log.save
    end
  end

  def self.get_temp_price_and_stock(url, price_tag, currency, stock_tag)
    seller = Seller.new(
        url: url,
        price_tag: price_tag,
        stock_tag: stock_tag,
        currency: currency
      )
    seller.scrape
    seller
  end


  def self.accepted_currencies_objects
    ACCEPTED_CURRENCIES.map { |currency| Money::Currency.find(currency) }
  end

  def scrape
    doc = Nokogiri::HTML(open(self.url))
    price_text = doc.at_css(self.price_tag).text
    self.temp_price = (BigDecimal(price_text.gsub(/[^0-9\.]/, ''))*100).to_i
    unless self.stock_tag.blank?
      stock_text = doc.at_css(self.stock_tag).text
      self.stock = BigDecimal(stock_text.gsub(/[^0-9\.]/, '')).to_i
    end
  end
end