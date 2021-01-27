class Task < ApplicationRecord
    belongs_to :user
    belongs_to :day

    validates :description, presence: true, uniqueness: {case_sensitive: false}
    validates :points, presence: true, numericality: {greater_than: 0, less_than: 11 }



end
