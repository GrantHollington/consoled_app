json.extract! review, :id, :comment, :buyer_id, :seller_id, :created_at, :updated_at
json.url review_url(review, format: :json)
