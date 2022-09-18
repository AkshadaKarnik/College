class Department < ApplicationRecord
	belongs_to :college
	has_many :users
	#before_create :
	validates :name, presence: true, length: { minimum: 3 }
  validates :course, presence: true
end
