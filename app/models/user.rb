# frozen_string_literal: true
class User < ApplicationRecord
  require 'securerandom'
  has_secure_password

  enum role: {student: 0, admin: 1}

  belongs_to :department, optional: true
  has_one :college, through: :department

  # belongs_to :college, optional: true
  # belongs_to :department, optional: true

=begin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
          :recoverable, :validatable, :confirmable
  enum role: {student: 0, admin: 1}
=end
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end