class CrimeReportersController < ApplicationController
  
  before_action :set_crime_reporter, only: [:show, :edit,:update, :destroy]
  before_action :require_user

  # Display list of crime reporters
  def index 
    @crime_reporters = CrimeReporter.all.order('created_at ASC')
  end 

  # Show specific details of Crime Reporter
  def show
  end

  # Add new Crime Reporter
  def new 
    @crime_reporter = CrimeReporter.new
  end 

  # Save new Crime Reporter
  def create 
    @crime_reporter = CrimeReporter.new(crime_reporter_params)
    if @crime_reporter.save
      respond_to do|format|
        format.html {redirect_to crime_reporters_path}
        format.js {redirect_to crime_reporters_path, :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  # Edit specific Crime Reporter Details
  def edit
  end 

  # Update specific Crime Reporter Details
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

  # Delete specific Crime Reporter details
  def destroy
    @crime_reporter.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  #private method to find crime reporter by id 
  def set_crime_reporter
    @crime_reporter = CrimeReporter.find(params[:id])
  end

  #private method to pass crime reporter parameters
  def crime_reporter_params
    params.require(:crime_reporter).permit(:name, :gender, :phone , :email)
  end

end
