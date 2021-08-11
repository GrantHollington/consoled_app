Rails.configuration.stripe = {
    :stripe_api_key => ENV['STRIPE_API_KEY']
    }
    Stripe.api_key = Rails.configuration.stripe[:stripe_api_key]