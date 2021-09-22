class CheckoutsController < ApplicationController
    def create     
        @webinar = Webinar.find(params[:id])
        @session = Stripe::Checkout::Session.create({
            # Passing in the currently logged in customer during checkout fills in info like the email automatically
            customer: current_user.stripe_customer_id,
            payment_method_types: ['card'],
            line_items: [{
                price: @webinar.stripe_price_id,
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