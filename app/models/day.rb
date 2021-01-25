class Day < ApplicationRecord
    has_many :tasks 
    has_many :users, through: :tasks
end
