class Seller
  require 'nokogiri'
  require 'open-uri'
  require 'bigdecimal'

  include Mongoid::Document
  include Mongoid::Timestamps

  ACCEPTED_CURRENCIES = [:hkd, :usd, :eur, :gbp, :cad, :jpy]

  attr_accessor :currency

  field :name, type: String
  field :url, type: String
  field :price_tag, type: String
  field :stock_tag, type: String
  field :price_to_cents, type: Money
  field :stock, type: Integer

  belongs_to :item

  before_save :scrape

  def self.accepted_currencies_objects
    ACCEPTED_CURRENCIES.map { |currency| Money::Currency.find(currency) }
  end

  def scrape
    doc = Nokogiri::HTML(open(self.url))
    price_text = doc.at_css(self.price_tag).text
    self.price_to_cents = (BigDecimal(price_text.gsub(/[^0-9\.]/, ''))*100).to_i
    unless self.stock_tag.blank?
      stock_text = doc.at_css(self.stock_tag).text
      self.stock = BigDecimal(stock_text.gsub(/[^0-9\.]/, '')).to_i
    end
  end
end