# frozen_string_literal: true
# An Application Controller
# If doing API hitting operations, let it be commented
class ApplicationController < ActionController::Base
=begin
  before_action :authenticate_user!

  protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:college_id, :department_id, :name, :age, :email, :password, :password_confirmation, :role)
        end
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:college_id, :department_id, :name, :age, :email, :password, :current_password, :role)
        end
    end
=end
end

 