class PaymentController < ApplicationController
  def create
    #fetch the listing
    @listing = Listing.find(params[:listing_id])

    #update the buyer
    @listing.buyer_id = current_user.profile.id
    @listing.save

    #implement stripe code
    Stripe.api_key = Rails.application.credentials.dig(:stripe_api_key)
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'aud',
          product_data: {
            name: @listing.title,
          },
          unit_amount: @listing.price,
        },
        quantity: 1,
      }],
      mode: 'payment',
      # These placeholder URLs will be replaced in a following step.
      #upon success redirected to listing show page, might get the buyer to leave a review
      success_url: "http://localhost:3000/listings/#{@listing.id}",
      #if the payment is cancelled show a cancel message
      cancel_url: "http://localhost:3000/payment/cancel",
    })
  
    redirect session.url
  end
end
