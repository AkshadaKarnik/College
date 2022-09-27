class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :course, :college_id

  belongs_to :college 
  has_many :users
end