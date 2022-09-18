class User < ApplicationRecord
  require "securerandom"

  #has_secure_password

  #belongs_to :college
  belongs_to :department, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable , :confirmable
  enum role: {student: 0, admin: 1}

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
