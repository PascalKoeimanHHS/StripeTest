class CheckoutsController < ApplicationController
    def create
        # Check whether this is a secure/stable way to handle the API key
        # Stripe.api_key = Rails.application.credentials[:stripe][:secret]

        @webinar = Webinar.find(params[:id])
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                name: @webinar.title,
                amount: @webinar.price,
                currency: "usd",
                quantity: 1
            }],
            mode: 'payment',
            success_url: root_url,
            cancel_url: root_url,
        })
        respond_to do |format|
            format.js
        end
    end
end