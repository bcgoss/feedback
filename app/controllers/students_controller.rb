class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
byebug
    @student = Student.new(student_params)
    if @student.save
      render :show
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      render :show
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :phone_number)
  end
end
