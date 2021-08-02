json.extract! listing, :id, :title, :description, :price, :type, :condition, :picture, :buyer_id, :seller_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
