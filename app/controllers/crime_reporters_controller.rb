class CrimeReportersController < ApplicationController
  
  before_action :set_crime_reporter, only: [:show, :edit,:update, :destroy]
  before_action :require_user, :crime_reporters

  def index 
    @crime_reporter = CrimeReporter.all
  end 

  def new 
    @crime_reporter = CrimeReporter.new
  end 

  def create 
    @crime_reporter=CrimeReporter.new(crime_reporter_params)
    if @crime_reporter.save
      flash[:notice] = "Crime Reporter details are added successfully"
      redirect_to  crime_reporters_path(@crime_reporter)
    else 
      render 'new'
    end
  end

  def show

  end

  def edit

  end 

  def update
    if @crime_reporter.update(crime_reporter_params)
      flash[:notice] = "Edited details Successfully"
      redirect_to  @crime_reporter
    else 
      render 'edit'
    end 
  end

  def destroy
    @crime_reporter.destroy
    redirect_to crime_reporters_path
  end

  private

  def set_crime_reporter
    @crime_reporter = CrimeReporter.find(params[:id])
  end

  def crime_reporter_params
    params.require(:crime_reporter).permit(:reporter_name, :gender, :phone , :email)
  end

end
