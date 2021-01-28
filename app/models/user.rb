class User < ApplicationRecord
    has_many :tasks 
    has_many :days, through: :tasks
    accepts_nested_attributes_for :tasks, allow_destroy: true
    has_secure_password

    validates :username, uniqueness: {case_sensitive: false}

    def self.from_google_signin(payload)
        
        user = nil
        # find or create a user based on the email address from the Google payload
        User.where(username: payload["email"]).first_or_create do |new_user|
            
            new_user.username = payload["email"]
            new_user.points = 0
            # we need to assign a password to satisfy bcrypt, so generate a random one...
            
            new_user.password = SecureRandom.base64(15)
            user = new_user
            
        end
        
        return user
    end
end
