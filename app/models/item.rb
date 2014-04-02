class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :image_url, type: String
  field :desired_price, type: Money

  attr_accessor :temp_price

  validates :name, presence: true
  validates :temp_price, numericality: { greater_than: 0 }
  before_save :create_desired_price

  belongs_to :user
  has_many :sellers

  accepts_nested_attributes_for :sellers, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? or attributes['url'].blank? }

  def create_desired_price
    self.desired_price = Money.new_with_amount(self.temp_price, self.user.fav_currency)
  end
end