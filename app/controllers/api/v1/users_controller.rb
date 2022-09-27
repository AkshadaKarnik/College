# frozen_string_literal: true
# User API
class Api::V1::UsersController < Api::V1::ApiController
  # skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]
  # before_action :check_admin, only: [:index, :create, :destroy]

  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer, root: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # render json: @user, status: :created
      render json: {data: UserSerializer.new(@user)}
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    if @user.destroy
      render json: @user, status: :deleted
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    # render json: @user, status: :ok
    render json: {data: UserSerializer.new(@user)}
  end

  def update
    unless @user.update(user_params)
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:department_id, :name, :age, :email, :password, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_admin
    render json: {errors: "you are not authorized to perform this action."} and return unless @current_user&.role == 'admin'
  end
end