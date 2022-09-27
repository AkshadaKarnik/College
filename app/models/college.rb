class College < ApplicationRecord
  # require 'securerandom'
  # has_secure_password

  has_many :departments, dependent: :destroy
  has_many :users, through: :departments
  # has_many :departments, dependent: :destroy
  # has_many :users, dependent: :destroy 
  
	validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true 
  validates :address, presence: true
  validates :contact, presence: true
end