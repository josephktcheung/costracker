require 'nokogiri'
require 'open-uri'
require 'pry'
require 'bigdecimal'

def scrape(url, options={})
  doc = Nokogiri::HTML(open(url))
  options.each do |k,v|
    if doc.at_css(v)
      text = doc.at_css(v).text
      case k
      when :price_to_cents
        options[k] = (BigDecimal(text.gsub(/[^0-9\.]/, ''))*100).to_i
      when :stock
        options[k] = BigDecimal(text.gsub(/[^0-9\.]/, '')).to_i
      else
        options[k] = text
      end
    else
      puts "cannot fetch #{k}"
      options.delete k
    end
  end
  options
end