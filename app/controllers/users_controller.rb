class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def index_stud
		@students = User.where(role: [0])
	end

	def show_stud
    @student = User.find(params[:id]).where(role: [0])
  end
=begin
  def edit_stud
    @user = User.find(params[:id])
  end

  def update_stud
    @user = User.find(params[:id])

    if @user.update(stud_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def stud_params
      params.require(:user).permit(:email, :role)
  end
=end
end
