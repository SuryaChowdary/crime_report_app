class CrimeReportersController < ApplicationController
  
  before_action :set_crime_reporter, only: [:show, :edit,:update, :destroy]
  before_action :require_user

  def index 
    @crime_reporters = CrimeReporter.all.order('created_at ASC')
  end 

  def new 
    @crime_reporter = CrimeReporter.new
  end 

  def create 
    @crime_reporter = CrimeReporter.new(crime_reporter_params)
    if @crime_reporter.save
      respond_to do|format|
        format.html {redirect_to crime_reporters_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  def show

  end

  def edit

  end 

  def update
    if @crime_reporter.update(crime_reporter_params)
      respond_to do |format|
        format.html { redirect_to @crime_reporter, notice: 'Crime Reporter details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end 
  end

  def destroy
    @crime_reporter.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_crime_reporter
    @crime_reporter = CrimeReporter.find(params[:id])
  end

  def crime_reporter_params
    params.require(:crime_reporter).permit(:name, :gender, :phone , :email)
  end

end
