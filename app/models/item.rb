class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :image_url, type: String

  validates :name, presence: true

  belongs_to :user
  has_many :sellers

  accepts_nested_attributes_for :sellers, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? or attributes['url'].blank? }
end