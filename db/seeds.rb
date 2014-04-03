User.destroy_all
Item.destroy_all
Seller.destroy_all
PriceLog.destroy_all

temp_password = '1234567'
User.create([
  { email: "josephktcheung@gmail.com", password: temp_password, password_confirmation: temp_password, fav_currency: "HKD" },
  { email: "joseph.testing.wdi2@gmail.com", password: temp_password, password_confirmation: temp_password, fav_currency: "USD" }
])

user1 = User.find_by(email: "josephktcheung@gmail.com")
user2 = User.find_by(email: "joseph.testing.wdi2@gmail.com")

user1.items.create!([
  {
    name: "PS4",
    image_url: "http://ecx.images-amazon.com/images/I/71PKbD5FhhL._SL1500_.jpg",
    temp_price: 3000
  },
  {
    name: "XBOX ONE",
    image_url: "http://ecx.images-amazon.com/images/I/51RgDBxhVnL._SL1000_.jpg",
    temp_price: 3500
  },
  {
    name: "SRH440",
    image_url: "http://ecx.images-amazon.com/images/I/818A4clxHLL._SL1500_.jpg",
    temp_price: 500
  },
  {
    name: "HD 650",
    image_url: "http://ecx.images-amazon.com/images/I/81zggHtrqML._SL1500_.jpg",
    temp_price: 1800
  },
  {
    name: "adidas Predator Absolion LZ TRX FG - Wht/Blk/Red",
    image_url: "http://ecx.images-amazon.com/images/I/51f0Ok7gHgL.jpg",
    temp_price: 500
  },
  {
    name: "Intel 530 Series 240GB",
    image_url: "http://ecx.images-amazon.com/images/I/91diAlwkLML._SL1500_.jpg",
    temp_price: 1500
  }
])

user2.items.create!([
  {
    name: "N54L",
    image_url: "http://image.nttxstore.jp/250_images/H/HP/HP14559029.jpg",
    temp_price: 350
  },
  {
    name: "Shure SE535",
    image_url: "http://ecx.images-amazon.com/images/I/7190Ympow7L._SL1500_.jpg",
    temp_price: 400
  }
])

ps4 = Item.find_by(name: "PS4")
ps4.sellers.create!([
  {
    name: "Amazon US",
    url: "http://www.amazon.com/PlayStation-4-Console/dp/B00BGA9WK2/ref=sr_1_1?ie=UTF8&qid=1395997437&sr=8-1&keywords=ps4",
    currency: "USD",
    price_tag: ".priceLarge"
  },
  {
    name: "Amazon JP",
    url: "http://www.amazon.co.jp/%E3%82%BD%E3%83%8B%E3%83%BC%E3%83%BB%E3%82%B3%E3%83%B3%E3%83%94%E3%83%A5%E3%83%BC%E3%82%BF%E3%82%A8%E3%83%B3%E3%82%BF%E3%83%86%E3%82%A4%E3%83%B3%E3%83%A1%E3%83%B3%E3%83%88-CUH-1000AB01-PlayStation-4/dp/B00IR18MEU/ref=sr_1_1?ie=UTF8&qid=1395997493&sr=8-1&keywords=ps4",
    currency: "JPY",
    price_tag: ".priceLarge"
  },
  {
    name: "Nojima",
    url: "http://online.nojima.co.jp/front/commodity/1/4948872413756/",
    currency: "JPY",
    price_tag: "#shohin-contents .price"
  }
])

xboxone = Item.find_by(name: "XBOX ONE")
xboxone.sellers.create!([
  {
    name: "Amazon US",
    url: "http://www.amazon.com/Xbox-One-Standard-Edition/dp/B00CMQTVUA/ref=sr_1_1?ie=UTF8&qid=1395998624&sr=8-1&keywords=xbox+one",
    currency: "USD",
    price_tag: ".priceLarge"
  },
  {
    name: "Amazon JP",
    url: "http://www.amazon.co.jp/Xbox-One-Console-Standard-Microsoft/dp/B00GM6LSUW/ref=sr_1_1?ie=UTF8&qid=1395998581&sr=8-1&keywords=xbox+one",
    currency: "JPY",
    price_tag: ".priceLarge"
  }
])

srh440 = Item.find_by(name: 'SRH440')
srh440.sellers.create!([
  {
    name: "Amazon US",
    url: "http://www.amazon.com/Shure-SRH440-Professional-Studio-Headphones/dp/B002DP1FTU/ref=sr_1_1?s=electronics&ie=UTF8&qid=1396426764&sr=1-1&keywords=srh440",
    currency: "USD",
    price_tag: "#priceblock_ourprice"
  },
  {
    name: "Amazon JP",
    url: "http://www.amazon.co.jp/SHURE-SRH440-A-%E3%80%90%E5%9B%BD%E5%86%85%E6%AD%A3%E8%A6%8F%E5%93%81%E3%80%91-%E3%83%97%E3%83%AD%E3%83%95%E3%82%A7%E3%83%83%E3%82%B7%E3%83%A7%E3%83%8A%E3%83%AB%E3%83%BB%E3%83%A2%E3%83%8B%E3%82%BF%E3%83%BC%E3%83%BB%E3%83%98%E3%83%83%E3%83%89%E3%83%9B%E3%83%B3/dp/B002UUQ8Z4/ref=sr_1_1?ie=UTF8&qid=1396426799&sr=8-1&keywords=srh440",
    currency: "JPY",
    price_tag: ".priceLarge"
  }
])

hd650 = Item.find_by(name: "HD 650")
hd650.sellers.create!([
  {
    name: "Amazon US",
    url: "http://www.amazon.com/Sennheiser-9969-HD-650-Headphones/dp/B00018MSNI/ref=sr_1_1?s=electronics&ie=UTF8&qid=1396427082&sr=1-1&keywords=hd650",
    currency: "USD",
    price_tag: "#priceblock_ourprice"
  },
  {
    name: "Amazon JP",
    url: "http://www.amazon.co.jp/%E3%80%90%E5%9B%BD%E5%86%85%E6%AD%A3%E8%A6%8F%E5%93%81%E3%80%91-%E3%82%BC%E3%83%B3%E3%83%8F%E3%82%A4%E3%82%B6%E3%83%BC-%E3%83%80%E3%82%A4%E3%83%8A%E3%83%9F%E3%83%83%E3%82%AF%E3%82%AA%E3%83%BC%E3%83%97%E3%83%B3%E3%82%A8%E3%82%A2%E3%83%98%E3%83%83%E3%83%89%E3%83%9B%E3%83%B3-%E3%83%8F%E3%82%A4%E3%82%B0%E3%83%AC%E3%83%BC%E3%83%89%E3%83%A2%E3%83%87%E3%83%AB-HD650/dp/B00018MSNI/ref=sr_1_2?ie=UTF8&qid=1396426974&sr=8-2&keywords=hd+598",
    currency: "JPY",
    price_tag: ".priceLarge"
  }
])

absolion = Item.find_by(name: "adidas Predator Absolion LZ TRX FG - Wht/Blk/Red")
absolion.sellers.create!([
  {
    name: "Amazon US",
    url: "http://www.amazon.com/Adidas-Predator-Soccer-Cleats-White/dp/B00DH94JBC/ref=sr_1_15?ie=UTF8&qid=1396427232&sr=8-15&keywords=adidas+Predator+Absolion+LZ+TRX+FG",
    currency: "USD",
    price_tag: "#priceblock_ourprice"
  },
  {
    name: "Prodirect Soccer",
    url: "http://www.prodirectsoccer.com/Products/adidas-Football-Boots-adidas-Predator-Absolion-LZ-TRX-FG-Firm-Ground-Soccer-Cleats-Running-WhiteBlackHiRes-Red-62094.aspx",
    currency: "GBP",
    price_tag: "#ProdPriceText h1"
  }
])

intel530 = Item.find_by(name: "Intel 530 Series 240GB")
intel530.sellers.create!([
  {
    name: "Amazon US",
    url: "http://www.amazon.com/Intel-2-5-Inch-Internal-Reseller-SSDSC2BW240A4K5/dp/B00DTPYT78/ref=sr_1_1?ie=UTF8&qid=1396427383&sr=8-1&keywords=intel+530",
    currency: "USD",
    price_tag: "#priceblock_ourprice"
  },
  {
    name: "Price.com.hk",
    url: "http://www.price.com.hk/product.php?p=162535",
    currency: "HKD",
    price_tag: ".head_a .price"
  }
])

se535 = Item.find_by(name: "Shure SE535")
se535.sellers.create!([
  {
    name: "Amazon US",
    url: "http://www.amazon.com/Shure-SE535-V-High-Definition-MicroDriver-Detachable/dp/B003NSBKT6/ref=sr_1_1?ie=UTF8&qid=1395999156&sr=8-1&keywords=se535",
    currency: "USD",
    price_tag: "#priceblock_ourprice"
  },
  {
    name: "Amazon JP",
    url: "http://www.amazon.co.jp/%E3%80%90%E5%9B%BD%E5%86%85%E6%AD%A3%E8%A6%8F%E5%93%81%E3%80%91-SHURE-%E9%AB%98%E9%81%AE%E9%9F%B3%E6%80%A7%E3%82%A4%E3%83%A4%E3%83%9B%E3%83%B3-%E3%83%A1%E3%82%BF%E3%83%AA%E3%83%83%E3%82%AF%E3%83%96%E3%83%AD%E3%83%B3%E3%82%BA-SE535-V-J/dp/B003YOH8RW/ref=sr_1_2?ie=UTF8&qid=1395999207&sr=8-2&keywords=se535",
    currency: "JPY",
    price_tag: ".head_a .price"
  }
])

n54l = Item.find_by(name: "N54L")
n54l.sellers.create!([
  {
    name: "Amazon US",
    url: "http://www.amazon.com/HP-MicroServer-N54L-NHP-250/dp/B00DODYE2A/ref=sr_1_2?ie=UTF8&qid=1395998891&sr=8-2&keywords=n54l",
    currency: "USD",
    price_tag: "#priceblock_ourprice"
  },
  {
    name: "Amazon JP",
    url: "http://www.amazon.co.jp/ProLiant-MicroServer-500GB-4GB%E3%83%A2%E3%83%87%E3%83%AB-F1F35A0-AAAE/dp/B00HJ2FAMA/ref=sr_1_1?ie=UTF8&qid=1395998845&sr=8-1&keywords=n54l",
    currency: "JPY",
    price_tag: ".priceLarge"
  },
  {
    name: "NTTX JP",
    url: "http://nttxstore.jp/_II_HP14559029",
    currency: "JPY",
    price_tag: ".detail .price span"
  }
])