class Seller < ApplicationRecord
  belongs_to :profile
  has_many :listings_to_sell
end
