class ApplicationController < ActionController::Base
    # Maybe move this to the checkouts_controller only?
    before_action :authenticate_user!
end
