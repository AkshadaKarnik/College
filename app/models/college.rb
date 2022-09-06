class College < ApplicationRecord
	has_many :students, through: :departments
	validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true 
  validates :address, presence: true
  validates :contact, presence: true
end
