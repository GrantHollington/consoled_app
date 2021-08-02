class Review < ApplicationRecord
  belongs_to :buyer, optional: true
  belongs_to :seller
end
