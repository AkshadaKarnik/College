class Api::V1::DepartmentsController < Api::V1::ApiController 
	before_action :my_dept, only: [:show, :edit, :update, :destroy]
	skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
	skip_before_action :verify_authenticity_token, only: [:create, :update]
	
	def index
		@departments = Department.all
		render json: @departments
	end

	def show
		render json: @department
	end

	def new
		@department = Department.new
		render json: @department
	end

	def create
		@department = Department.new(dept_params)
    
    if @department.save
      #redirect_to @department
      render json: @department
    else
      #render :new, status: :unprocessable_entity
      render error: { error: 'Unable to create department'}, status: 400
    end
	end

	def edit
		render json: @department
	end

	def update
		if @department
			@department.update(dept_params)
			#redirect_to @department
			render json: { message: 'department succefully updated'}, status: 200
		else
			#render :edit, status: :unprocessable_entity
			render error: { error: 'Unable to update department'}, status: 400
		end
	end

	def destroy
		@department.destroy
		#redirect_to root_path, status: :see_other
		render json: @department
	end

	private
	def dept_params
		params.require(:department).permit(:college_id, :name, :course)#, :status)
	end
	def my_dept
		@department = Department.find(params[:id])
	end
end