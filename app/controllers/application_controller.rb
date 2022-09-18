class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
=begin
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :role)}
      end
=end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:college_id, :department_id, :name, :age, :email, :password, :password_confirmation, :role)
        end
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:college_id, :department_id, :name, :age, :email, :password, :current_password, :role)
        end
    end
end

 