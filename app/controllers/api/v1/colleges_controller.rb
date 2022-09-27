# frozen_string_literal: true
# College API
class Api::V1::CollegesController < Api::V1::ApiController
  before_action :authenticate_request, only: [:create]
  before_action :my_college, only: [:show, :update, :destroy]
  before_action :check_admin#, only: [:index, :show, :update, :destroy] # :create]

  def index
    @colleges = College.all 
    # render json: @colleges, status: :ok
    render json: @colleges, each_serializer: CollegeSerializer, root: @colleges
  end

  def show
     render json: {data: CollegeSerializer.new(@college)}
  end

  def create
      @college = College.new(college_params)
      if @college.save
         render json: {data: CollegeSerializer.new(@college)}
      else
        render json: {errors: @college.errors.full_messages}, status: :unprocessable_entity
      end
    # else
      
    # end
  end

  def update
    unless @college.update(college_params)
      render json: {errors: @college.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    if @college.destroy
      render json: @college, status: :deleted
    else
      render json: {errors: @college.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def college_params
    params.permit(:name, :email, :address, :contact)
  end

  def my_college
    @college = College.find(params[:id])
  end

  def check_admin
  byebug
    render json: {errors: "you are not authorized to perform this action."} and return unless @current_user&.role == 'admin'
  end
end