class CohortsController < ApplicationController
  def show
    @cohort = Cohort.find(params[:id])
  end

  def index
    @cohorts = Cohort.all
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find(params[:id])
    if @cohort.update_attributes(cohort_params)
      flash[:success] = 'Cohort updated'
      render :show
    else
      flash[:error] = @cohort.errors.full_messages.join('. ')
      render :edit
    end
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      flash[:success] = 'Cohort Created'
      render :show
    else
      flash[:error] = @cohort.errors.full_messages.join('. ')
      render :new
    end
  end

  private

  def cohort_params
    params.require(:cohort).permit(:graduation_year)
  end
end
