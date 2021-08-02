class Listing < ApplicationRecord
  #buyer is not maditory so optional is added
  belongs_to :buyer, optional: true
  belongs_to :seller
end
