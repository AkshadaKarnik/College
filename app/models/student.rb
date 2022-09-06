class Student < ApplicationRecord
	belongs_to :college
	belongs_to :department

	validates :name, presence: true, length: { minimum: 3 }
  validates :enroll_no, presence: true
  validates :clg_start_date, presence: true
  validates :clg_end_date, presence: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :contact, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :permanent_address, presence: true
  validates :current_address, presence: true
  validates :aadhar_no, presence: true
end



 