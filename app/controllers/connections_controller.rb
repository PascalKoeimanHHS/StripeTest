class ConnectionsController < ApplicationController
    def redirect
        @auth_code = params[:code]

        response = Stripe::OAuth.token({
            grant_type: 'authorization_code',
            code: @auth_code,
        })

        puts response

        if current_user.update(stripe_account_id: response.stripe_user_id)
            puts "Succesfully updated the database entry too."
        end
    end
end