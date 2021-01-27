class ApplicationController < ActionController::API
    def authenticate
        @current_user = AuthorizeRequest.new(request.headers).user
        render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
    end
end
