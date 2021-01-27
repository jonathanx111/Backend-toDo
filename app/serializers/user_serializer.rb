class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :points
  has_many :tasks


  # has_many :days, through: :tasks
  
  
  # def tasks
  #     ActiveModel::SerializableResource.new(object.tasks, each_serializer: TaskSerializer)
  # end


end
