class AuthController < ApplicationController
    def register 
        user = User.create(register_params)

        if user.valid? 
            token = encode_token({ user_id: user.id})
            render json: { user: UserSerializer.new(user), token: token}, status: :created
        else 
            render json: {error: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def login
    # find user
        user = User.find_by(username: params[:username])
    # authenticate password
        if user && user.authenticate(params[:password])
      # send back a token that they can use to re-authenticate themselves
            token = encode_token({ user_id: user.id })
            render json: { user: UserSerializer.new(user), token: token } 
        else
      # if not, send an error
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    private 

    def register_params 
        params.permit(:username, :password, :points)
    end

    def encode_token(payload)
        JWT.encode(payload,  ENV["jwt_key"], "HS256")
    end
end
