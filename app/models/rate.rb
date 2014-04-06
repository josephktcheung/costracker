class Rate
  include Mongoid::Document

  field :rate, type: Hash
  field :date, type: Date
end