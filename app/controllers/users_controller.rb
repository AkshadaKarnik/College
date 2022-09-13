class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def stud_profile
		@current_stud = current_user
	end

	def show_stud
    #byebug
    @student = User.find(current_user.id)
  end

  def edit_stud
    #byebug
    @student = User.find(current_user.id)
  end

  def update_stud
    @student = User.find(current_user.id)

    if @student.update(stud_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def stud_params
      params.require(:user).permit(:email, :role, :status)
  end
end