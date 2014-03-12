require 'nokogiri'
require 'open-uri'
require 'pry'

def scrape(url, elements={})
  doc = Nokogiri::HTML(open(url))
  elements.each do |k,v|
    elements[k] = doc.at_css(v).text
  end
  puts elements
end

url = "http://www.pg-direct.jp/products/detail/6251"
scrape url, price: "#price02_default", stock: "span.sale_price"

binding.pry