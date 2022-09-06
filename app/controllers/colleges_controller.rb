class CollegesController < ApplicationController

	before_action :set_college, only: %i[ show edit update destroy ]

	# GET /colleges or /colleges.json
	#before_action :authenticate_user!
	def index	#collection
		@colleges = College.all
	end

	# GET /colleges/1 or /colleges/1.json
	#before_action :authenticate_user!
	def show #member(if showing particular record using id) OR #collection(if showing the whole list of records)
		@college = College.find(params[:id])
	end

	# GET /colleges/new
	#before_action :authenticate_user!
	def new	#member
		@college = College.new
	end

	# GET /colleges/1/edit
	#before_action :authenticate_user!
	def edit #member

	end

	# POST /colleges or /colleges.json
	#before_action :authenticate_user!
  def create
    @college = College.new(college_params)

    respond_to do |format|
      if @college.save
        format.html { redirect_to college_url(@college), notice: "College has been created successfully :)" }
        format.json { render :show, status: :created, location: @college }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colleges/1 or /colleges/1.json
  #before_action :authenticate_user!
  def update
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to college_url(@college), notice: "College has been successfully updated." }
        format.json { render :show, status: :ok, location: @college }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colleges/1 or /colleges/1.json
  #before_action :authenticate_user!
  def destroy
    @college.destroy

    respond_to do |format|
      format.html { redirect_to colleges_url, notice: "College has been successfully destroyed :(" }
      format.json { head :no_content }
    end
  end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_college
	  @college = College.find(params[:id])
	end

	# Only allow a list of trusted parameters through.
	def college_params
	  params.require(:college).permit(:name, :email, :address, :contact)
	end
end
