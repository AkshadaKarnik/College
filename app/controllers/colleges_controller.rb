# frozen_string_literal: true
# A College Controller 
class CollegesController < ApplicationController
  before_action :my_college, only: [:show, :edit, :update, :destroy]	
  
  def index # Upto this only router has mapped the route to this index action of this CollegesController
    @colleges = College.all #Now, this index action uses the College model to fetch all colleges from the database n assigns this to the @colleges instance variable.
  end

# Read
  def show
  end

  def new
    @college = College.new
  end

# Create
  def create
    @college = College.new(college_params)

    if @college.save
      redirect_to @college
    else
      render :new, status: :unprocessable_entity
    end
  end

# Update
  def edit
  end

  def update
    if @college
      @college.update(college_params)
      redirect_to @college
    else
      render :edit, status: :unprocessable_entity
    end
  end

# Delete
  def destroy
    @college.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def college_params
    params.require(:college).permit(:name, :email, :address, :contact, :status)
  end
  
  def my_college
    @college = College.find(params[:id])
  end
end