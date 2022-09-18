class Api::V1::UsersController < Api::V1::ApiController
=begin
  before_action :my_stud, only: [:show_stud, :edit_stud, :update_stud]
  skip_before_action :authenticate_user!, only: [:index, :stud_profile, :show_stud, :edit_stud, :update_stud]
  skip_before_action :verify_authenticity_token, only: [:update_stud]
  
  def index
    @users = User.all
    render json: @users
  end

  def stud_profile
    @current_stud = current_user
    render json: @current_stud
  end

  def show_stud
    render json: @student
  end

  def edit_stud
    render json: @student
  end

  def update_stud
    if @student
      @student.update(stud_params)
      redirect_to @student
      render json: { message: 'Hey student, you got succefully updated'}, status: 200
    else
      render :edit, status: :unprocessable_entity
      render error: { error: 'Unable to update you(student)'}, status: 400
    end
  end

  private
  def stud_params
      params.require(:user).permit(:email, :role)
  end
  def my_stud
    @student = User.find(current_user.id)
  end 
=end

skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all 
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user#, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
  def user_params
    params.permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end