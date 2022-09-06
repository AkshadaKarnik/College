class Department < ApplicationRecord
	belongs_to :college
	has_many :students
	#before_create :
	validates :name, presence: true, length: { minimum: 3 }
  validates :course, presence: true
end
