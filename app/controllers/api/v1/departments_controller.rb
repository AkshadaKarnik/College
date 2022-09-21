# frozen_string_literal: true
# Department API
class Api::V1::DepartmentsController < Api::V1::ApiController
	skip_before_action :authenticate_request, only: [:create]
  before_action :my_dept, only: [:show, :update, :destroy]

	def index
		@departments = Department.all
		render json: @departments, status: :ok
	end

	def show
		render json: @department, status: :ok
	end

	def create
		@department = Department.new(dept_params)
    if @department.save
    	 render json: @department, status: :created
    else
    	render json: {errors: @department.errors.full_messages}, status: :unprocessable_entity
    end
	end

	def update
		unless @department.update(dept_params)
      render json: {errors: @department.errors.full_messages}, status: :unprocessable_entity
    end
	end

	def destroy
		@department.destroy
	end

	private

	def dept_params
		params.permit(:name, :course)
	end

	def my_dept
		@department = Department.find(params[:id])
	end
end