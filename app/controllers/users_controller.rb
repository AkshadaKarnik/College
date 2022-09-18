# frozen_string_literal: true
# Users Controller 
class UsersController < ApplicationController

  before_action :my_stud, only: [:show_stud, :edit_stud, :update_stud]
   
	def index
		@users = User.all
	end

	def stud_profile
		@current_stud = current_user
	end

	def show_stud
    # @stud_dept = current_user.Department.where(department_id).select(:department_id, :name).take 
  end

  def edit_stud
  end

  def update_stud
    if @student
      @student.update(stud_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def stud_params
    params.require(:user).permit(:college_id, :department_id, :name, :age, :email, :role) 
  end
  
  def my_stud
    @student = User.find(current_user.id)
  end 
end