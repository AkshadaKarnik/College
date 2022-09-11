class DepartmentsController < ApplicationController 
	def index
		@departments = Department.all
	end

	def show
		@department = Department.find(params[:id])
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
		@department = Department.find(params[:id])
	end

	def update
		@department = Department.find(params[:id])

		if @department.update(dept_params)
			redirect_to @department
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@department = Department.find(params[:id])
		@department.destroy
		redirect_to root_path, status: :see_other
	end

	private
	def dept_params
		params.require(:department).permit(:college_id, :name, :course, :status)
	end
end