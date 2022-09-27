# frozen_string_literal: true
class Department < ApplicationRecord
	# require 'securerandom'
	# has_secure_password
	
	belongs_to :college#, optional: true
	has_many :users, dependent: :destroy

	# belongs_to :college
	# has_many :users, dependent: :destroy

	validates :name, presence: true, length: { minimum: 3 }
  validates :course, presence: true
end
