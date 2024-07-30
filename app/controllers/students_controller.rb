class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]

    def index
        @students = Student.all
        render json: {students: @students}
    end

    def show
        # @student = Student.find(params[:id])
        # render json: @student
    end
    def new
        @student = Student.new
        @programs = Program.all
    end

    def edit
        @programs = Program.all
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to @student, notice: "student was successfully created."
        else
            @programs = Program.all
            render :new
        end
    end

    def update
        if @student.update(student_params)
            redirect_to @student, notice: "Student was successfully updated."
        else
            @programs = Program.all
            render :edit
    end

    def destroy
        @student.destroy
        redirect_to students_url, notice: "Student was successfully deleted."
    end

    private
    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(
            :fullname, :gender, :date, :contact, :church, :email, :responsibility, :description, :motivation, :challenges, :availability, :commitments, :achievements, program_ids: [] 
        )
    end
end
