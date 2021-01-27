class UsersController < ApplicationController
    before_action :authenticate

    def show 
        render json: @user
    end

    def edit_profile
        @current_user.update(username: params[:username], points: params[:points])
        render json: @current_user
    end

    private 

    def user_params 
        params.require(:points)
    end
end
