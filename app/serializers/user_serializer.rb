class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :email, :role, :department_id #:recently_joined?
  has_one :college#, through: :department 
  belongs_to :department 

  # def recently_joined?
  #   Date.today.prev_month < object.created_at
  # end
end
