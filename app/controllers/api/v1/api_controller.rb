# frozen_string_literal: true
# An API Controller
class Api::V1::ApiController < ActionController::API
  include JsonWebToken
	
  before_action :authenticate_request

  private

  def authenticate_request
    begin
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      #byebug
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])      
    rescue StandardError => e
      puts "#{e}"
    end
  end
end