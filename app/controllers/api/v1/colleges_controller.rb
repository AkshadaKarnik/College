# frozen_string_literal: true
# College API
class Api::V1::CollegesController < Api::V1::ApiController
  skip_before_action :authenticate_request, only: [:create]
  before_action :my_college, only: [:show, :update, :destroy]
  
  def index
    @colleges = College.all 
    render json: @colleges, status: :ok
  end

  def show
    render json: @college, status: :ok
  end

  def create
    @college = College.new(college_params)
    if @college.save
      render json: @college, status: :created
    else
      render json: {errors: @college.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    unless @college.update(college_params)
      render json: {errors: @college.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @college.destroy
  end

  private

  def college_params
    params.permit(:name, :email, :address, :contact)
  end

  def my_college
    @college = College.find(params[:id])
  end
end