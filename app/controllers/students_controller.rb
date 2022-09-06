class StudentsController < ApplicationController
	before_action :set_college, only: %i[ show edit update destroy ]

	# GET /students or /students.json
	#before_action :authenticate_user!
	def index	#collection
		@students = Student.all
	end

	# GET /students/1 or /students/1.json
	#before_action :authenticate_user!
	def show #member(if showing particular record using id) OR #collection(if showing the whole list of records)
		@student = Student.find(params[:id])
	end

	# GET /students/new
	#before_action :authenticate_user!
	def new	#member
		@student = Student.new
	end

	# GET /students/1/edit
	#before_action :authenticate_user!
	def edit #member

	end

	# POST /students or /students.json
	#before_action :authenticate_user!
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student has been created successfully :)" }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  #before_action :authenticate_user!
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student has been successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  #before_action :authenticate_user!
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student has been successfully destroyed :(" }
      format.json { head :no_content }
    end
  end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_student
	  @student = Student.find(params[:id])
	end

	# Only allow a list of trusted parameters through.
	def student_params
	  params.require(:student).permit(:name, :enroll_no, :clg_start_date, :clg_end_date, :gender, :age, :contact, :email, :password, :permanent_address, :current_address, :aadhar_no)
	end
end

 
      