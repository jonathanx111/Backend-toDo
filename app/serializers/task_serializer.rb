class TaskSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :day_id, :description, :points, :done, :day
  has_one :day
  # def days 
  #       ActiveModel::SerializableResource.new(object.days,  each_serializer: DaySerializer)
  # end
end
