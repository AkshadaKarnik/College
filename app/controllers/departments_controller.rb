# frozen_string_literal: true
# Departments Controller
class DepartmentsController < ApplicationController 
	before_action :my_dept, only: [:show, :edit, :update, :destroy]
		
	def index
		@departments = Department.all
	end

	def show
	end

	def new
		@department = Department.new
	end

	def create
		@department = Department.new(dept_params)
    
    if @department.save
      redirect_to @department
    else
      render :new, status: :unprocessable_entity
    end
	end

	def edit
	end

	def update
		if @department
			@department.update(dept_params)
			redirect_to @department
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@department.destroy
		redirect_to root_path, status: :see_other
	end

	private

	def dept_params
		params.require(:department).permit(:college_id, :name, :course, :status)
	end
	
	def my_dept
		@department = Department.find(params[:id])
	end
end