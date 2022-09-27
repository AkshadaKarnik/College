class CollegeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :contact
  has_many :departments 
  has_many :users
end