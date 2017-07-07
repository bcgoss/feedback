class LecturesController < ApplicationController
  def show
    @lecture = Lecture.find(params[:id])
  end

  def index
    @cohort = Cohort.find(params[:cohort_id])
    @lectures = @cohort.lectures
  end
end
