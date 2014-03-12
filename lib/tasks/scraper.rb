require 'nokogiri'
require 'open-uri'
require 'pry'
require 'bigdecimal'

def scrape(url, options={})
  doc = Nokogiri::HTML(open(url))
  options.each do |k,v|
    puts text = doc.at_css(v).text
    case k
    when :price
      options[k] = (BigDecimal(text.gsub(/[^0-9\.]/, ''))*100).to_i
    when

    else

    end
     k == :price

    end
  end
end

url = "http://www.pg-direct.jp/products/detail/6251"
scrape url, price: "#price02_default", stock: "span.sale_price"