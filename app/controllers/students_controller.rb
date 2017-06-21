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
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "#{@student.name} added"
      redirect_to cohort_path @student.cohort
    else
      flash[:error] = @student.errors.full_messages.join('. ')
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:success] = @student.name + ' updated' 
      render :show
    else
      flash[:error] = @student.errors.full_messages.join('. ')
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :phone_number, :cohort_id)
  end
end
