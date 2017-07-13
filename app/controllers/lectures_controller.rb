class LecturesController < ApplicationController
  def show
    @lecture = Lecture.find(params[:id])
  end

  def index
    @cohort = Cohort.find(params[:cohort_id])
    @lectures = @cohort.lectures
  end

  def new
    @cohort = Cohort.find(params[:cohort_id])
    @lecture = @cohort.lectures.new
  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @lecture = @cohort.lectures.new(lecture_params)
    if @lecture.save
      redirect_to cohort_lecture_path @lecture
    else
      flash.now[:error] = @lecture.errors.full_messages.join('. ')
      render :new
    end
  end


  private

  def lecture_params
    params.require(:lecture).permit(:start_at, :duration)
  end
end
