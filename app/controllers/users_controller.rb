class UsersController < ApplicationController
    before_action :authenticate, except: [:create]

    def show 
        render json: @user
    end

    def edit_profile
        @current_user.update(username: params[:username], points: params[:points])
        render json: @current_user
    end

    def create
    @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'Username Already Taken' }, status: :bad_request
        end
    end

    private 

    def user_params 
        params.permit(:username, :points, :password)
    end

    def encode_token(payload)
        JWT.encode(payload,  ENV["jwt_key"], "HS256")
    end
end
