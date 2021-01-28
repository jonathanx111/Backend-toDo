class ApplicationController < ActionController::API
    def authenticate
        # Auth with token
        # see app/services/authorize_request.rb for this code
        @user = AuthorizeRequest.new(request.headers).user
    
        # Fake auth
        # @user = User.first

        unless !@user
          render json: { error: "Unauthorized request" }, status: :unauthorized
        end
    # continue to the rest of the action
    end

    
end
