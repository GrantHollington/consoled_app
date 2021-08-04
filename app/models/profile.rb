class Profile < ApplicationRecord
  belongs_to :user
  has_one :seller
  has_one :buyer
end
