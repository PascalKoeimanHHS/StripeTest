class ConnectionsController < ApplicationController
    def success
        @auth_code = params[:code]

        response = Stripe::OAuth.token({
            grant_type: 'authorization_code',
            code: @auth_code,
        })

        connected_account_id = response.stripe_user_id
    end
end