class Api::V1::CollegesController < Api::V1::ApiController
  before_action :my_college, only: [:show, :edit, :update, :destroy]  
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def index #Upto this only router has mapped the route to this index action of this CollegesController
    @colleges = College.all #Now, this index action uses the College model to fetch all colleges from the database n assigns                           #this to the @colleges instance variable.
    render json: @colleges 
  end

#Read
  def show
    render json: @college
  end

  def new
    @college = College.new
    render json: @college
  end

#Create
  def create
    @college = College.new(college_params)

    if @college.save
      redirect_to @college
      render json: @college
    else
      render :new, status: :unprocessable_entity
      render error: { error: 'Unable to create college'}, status: 400
    end
  end

#Update
  def edit
    render json: @college
  end

  def update
    if @college
      @college.update(college_params)
      redirect_to @college
      render json: { message: 'college succefully updated'}, status: 200
    else
      render :edit, status: :unprocessable_entity
      render error: { error: 'Unable to update college'}, status: 400
    end
  end

#Delete
  def destroy
    @college.destroy
    redirect_to root_path, status: :see_other
    render json: @college
  end

#Param hash
  private
  def college_params
    params.require(:college).permit(:name, :email, :address, :contact)#, :status)
  end
  def my_college
    @college = College.find(params[:id])
  end
end