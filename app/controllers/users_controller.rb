class UsersController < ApplicationController

  before_action :my_stud, only: [:show_stud, :edit_stud, :update_stud]
   
	def index
		@users = User.all
    #render json: @users
	end

	def stud_profile
		@current_stud = current_user
    #render json: @current_stud
	end

	def show_stud
    #@stud_dept = current_user.Department.select(:name)
    #render json: @student
  end

  def edit_stud
    #render json: @student
  end

  def update_stud
    if @student
      @student.update(stud_params)
      redirect_to @student
      #render json: { message: 'Hey student, you got succefully updated'}, status: 200
    else
      render :edit, status: :unprocessable_entity
      #render error: { error: 'Unable to update you(student)'}, status: 400
    end
  end

  private
  def stud_params
    params.require(:user).permit(:college_id, :department_id, :name, :age, :email, :role)#, :status)
  end
  def my_stud
    @student = User.find(current_user.id)
  end 
end