class CrimesController < ApplicationController

  before_action :set_crime , only: [:show, :edit,:update, :destroy]
  before_action :require_user, except: [:new, :create]

  # Display list of all Crimes
  def index 
    @crimes = Crime.all.order('created_at ASC')
  end 
  
  # Add new Crime
  def new 
    @crime = Crime.new
  end 
  
  # Save new Crime
  def create 
    @crime = Crime.new(crime_params)
    if @crime.save
      respond_to do|format|
        format.html {redirect_to crimes_path}
        format.js {redirect_to crimes_path, :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end 

  # Details of specific crime
  def show 
    
  end

  # Edit specific Crime
  def edit

  end

  # Update specific Crime details
  def update
    if @crime.update(crime_params)
      respond_to do |format|
        format.html { redirect_to @crime, notice: 'Crime details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end 
  end

  # Delete specific Crime 
  def destroy
    @crime.destroy
    respond_to do |format|
      format.html
      format.js {render }
    end
  end
  
  # Fetch localities by cities in crime add and edit actions
  def locality_by_city
    @localities = Locality.where(city_id: params[:cities])
    respond_to do |format|
      format.js { render :locality_by_city }
    end
  end
  
  private

  # private method to find crime with its id
  def set_crime
    @crime = Crime.find(params[:id])
  end

  # private method to pass crime parameters for addind and updating crimes
  def crime_params
    params.require(:crime).permit(:name, :crime_description, :crime_time, :priority, :resolved, :city_id, :locality_id, :crime_reporter_id)
  end

end