class Listing < ApplicationRecord
  #buyer is not maditory so optional is added
  belongs_to :buyer, optional: true
  belongs_to :seller
  #association for uploading multiple images
  has_many_attached :pictures
end
