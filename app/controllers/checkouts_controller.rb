class CheckoutsController < ApplicationController
    def create     
        @webinar = Webinar.find(params[:id])

        # Get information about the pricing and configure the application fee
        price = Stripe::Price.retrieve(@webinar.stripe_price_id)
        amount = price.unit_amount
        fee_percentage = 0.05
        fee_amount = (amount * fee_percentage).round
        transfer_destination = "acct_1JcUHeHt9ZyfP7MS"

        @session = Stripe::Checkout::Session.create({
            # Passing in the currently logged in customer during checkout fills in info like the email automatically
            customer: current_user.stripe_customer_id,
            payment_method_types: ['card'],
            payment_intent_data: {
                application_fee_amount: fee_amount,
                transfer_data: {
                    destination: transfer_destination,
                },
            },
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