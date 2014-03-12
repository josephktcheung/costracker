require 'nokogiri'
require 'open-uri'
require 'pry'

def scrape(url, options={})
  doc = Nokogiri::HTML(open(url))
  options.each do |k,v|
    puts text = doc.at_css(v).text
    options[k] = text.gsub(/[^0-9\.]/, '').to_f*100.to_i
    puts options[k].class
  end
  puts options
end

url = "http://www.pg-direct.jp/products/detail/6251"
scrape url, price: "#price02_default", stock: "span.sale_price"