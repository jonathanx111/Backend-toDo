require 'dotenv'
Dotenv.load
class UsersController < ApplicationController
    before_action :authenticate, except: [:create, :google_login]

    def google_login
        # use a helper method to extract the payload from the google token
        payload = get_google_token_payload
        if payload
            # find/create user from payload (this will be a new method in the User model)
            user = User.from_google_signin(payload)
            byebug
            if user
                # save user_id in token so we can use it in future requests
                token = encode_token({ user_id: user.id })

                    # send token and user in response
                render json: { user: UserSerializer.new(user), token: token }
                return
            end
        end

                # for invalid requests, send error messages to the front end
        render json: { message: "Could not log in" }, status: :unauthorized
    end

  private

  # helper function to validate the user's token from Google and extract their info
    def get_google_token_payload
        
        
        if request.headers["Authorization"]
        # extract the token from the Authorization header
        token_id = request.headers["Authorization"].split(" ")[1]
            
        # this is the code from the Google auth gem
        validator = GoogleIDToken::Validator.new
        begin

            # check the token_id and return the payload
            # make sure your .env file has a matching key
            validator.check(token_id, ENV["GOOGLE_OAUTH_CLIENT_ID"])
            
        rescue GoogleIDToken::ValidationError => e
            
            p "Cannot validate: #{e}"
            
        end
        end
    end
    
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
