class Buyer < ApplicationRecord
  belongs_to :profile
  has_many :reviews
  has_many :listings
end
