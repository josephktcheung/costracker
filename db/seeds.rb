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
    desired_price: Money.new_with_amount(3000, "HKD")
  },
  {
    name: "XBOX ONE",
    image_url: "http://ecx.images-amazon.com/images/I/51RgDBxhVnL._SL1000_.jpg",
    desired_price: Money.new_with_amount(3500, "HKD")
  }
])

user2.items.create!([
  {
    name: "N54L",
    image_url: "http://image.nttxstore.jp/250_images/H/HP/HP14559029.jpg",
    desired_price: Money.new_with_amount(350, "USD")
  },
  {
    name: "Shure SE535",
    image_url: "http://ecx.images-amazon.com/images/I/7190Ympow7L._SL1500_.jpg",
    desired_price: Money.new_with_amount(400, "USD")
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
    price_tag: "#shohin-contents"
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
  },
  {
    name: "Price.com.hk",
    url: "http://www.price.com.hk/product.php?p=160453",
    currency: "HKD",
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
  },
  {
    name: "Price.com.hk",
    url: "http://www.price.com.hk/product.php?p=150256",
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
    price_tag: ".priceLarge"
  },
  {
    name: "Price.com.hk",
    url: "http://www.price.com.hk/product.php?p=118746",
    currency: "HKD",
    price_tag: ".detail .price span"
  }
])

