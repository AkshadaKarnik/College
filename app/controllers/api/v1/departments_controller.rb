# frozen_string_literal: true
# Department API
class Api::V1::DepartmentsController < Api::V1::ApiController
	before_action :authenticate_request, only: [:create]
  before_action :my_dept, only: [:show, :update, :destroy]
  before_action :check_admin, only: [:index, :show, :update, :destroy] #:create]


	def index
		@departments = Department.all
		# render json: @departments, status: :ok
		render json: @departments, each_serializer: DepartmentSerializer, root: @departments
	end

	def show
		# render json: @department, status: :ok
		render json: {data: DepartmentSerializer.new(@department)}
	end

	def create
		@department = Department.new(dept_params)
    if @department.save
    	render json: {data: DepartmentSerializer.new(@department)}
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
		if @department.destroy
      render json: @department, status: :deleted
    else
      render json: {errors: @department.errors.full_messages}, status: :unprocessable_entity
    end
	end

	private

	def dept_params
		params.permit(:college_id, :name, :course)
	end

	def my_dept
		@department = Department.find(params[:id])
	end

	def check_admin
    render json: {errors: "you are not authorized to perform this action."} and return unless @current_user&.role == 'admin'
  end
end