class Seller < ApplicationRecord
  belongs_to :profile
  has_many :listings
end
