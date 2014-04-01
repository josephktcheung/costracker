class PriceLog

  include Mongoid::Document

  field :price, type: Money
  field :date, type: Date

  belongs_to :seller
end