class TaskSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :day_id, :description, :points, :done
  belongs_to :day
end
