class PriceLog

  include Mongoid::Document
  include Mongoid::Timestamps

  field :price, type: Money
  field :date, type: Date

  belongs_to :seller
end