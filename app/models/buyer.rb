class Buyer < ApplicationRecord
  belongs_to :profile
  has_many :reviews_to_make
  has_many :reviews_to_receive
  has_many :listings_to_buy
end
