# frozen_string_literal: true
class Department < ApplicationRecord
	belongs_to :college
	has_many :users
	validates :name, presence: true, length: { minimum: 3 }
  validates :course, presence: true
end
