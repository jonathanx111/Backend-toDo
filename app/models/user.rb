class User < ApplicationRecord
    has_many :tasks 
    has_many :days, through: :tasks
    accepts_nested_attributes_for :tasks, allow_destroy: true
    has_secure_password
end
