class PaymentController < ApplicationController
  def create
    #fetch the listing using params
    @listing = Listing.find(params[:listing_id])

    #update the buyer here is not good practice, moved to listings controller show method
    # @listing.buyer_id = current_user.profile.id
    # @listing.save

    #fetch the root path in development or deployment 
    if ENV['RAILS_ENV'] == "development"
      root_path = "http://localhost:3000"
      Stripe.api_key = Rails.application.credentials.dig(:stripe, :stripe_api_key)
      else
      root_path = ENV['ROOT_PATH']
      Stripe.api_key = Rails.configuration.stripe[:stripe_api_key]
      end

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
          unit_amount: @listing.price.to_i * 100,
        },
        quantity: 1,
      }],
      mode: 'payment',
      # These placeholder URLs will be replaced in a following step.
      #upon success redirected to listing show page, might get the buyer to leave a review. use string interpolation to attach the root path.
      success_url: "#{root_path}/listings/#{@listing.id}?checkout=success",
      #if the payment is cancelled show a cancel message
      cancel_url: "#{root_path}/payment/cancel",
    })
  
    redirect_to session.url
  end

  def cancel
    #directs to public 404 page if user cancels payment
    render file: 'public/404.html', layout: false, status: :not_found 
  end
end
