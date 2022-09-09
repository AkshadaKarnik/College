class CollegesController < ApplicationController	
	def index #Upto this only router has mapped the route to this index action of this CollegesController
    @colleges = College.all #Now, this index action uses the College model to fetch all colleges from the database n assigns 
                            #this to the @colleges instance variable.
  end

#Read
  def show
    @college = College.find(params[:id])
  end

  def new
    @college = College.new
  end

#Create
  def create
    @college = College.new(college_params)
    
    if @college.save
      redirect_to @college
    else
      render :new, status: :unprocessable_entity
    end
  end

#Update
  def edit
    @college = College.find(params[:id])
  end

  def update
    @college = College.find(params[:id])

    if @college.update(college_params)
      redirect_to @college
    else
      render :edit, status: :unprocessable_entity
    end
  end

#Delete
  def destroy
    @college = College.find(params[:id])
    @college.destroy

    redirect_to root_path, status: :see_other
  end

#Param hash
  private
  def college_params
      params.require(:college).permit(:name, :email, :address, :contact, :status)
  end
end
