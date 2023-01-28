class CrimesController < ApplicationController

  before_action :set_crime , only: [:show, :edit,:update, :destroy]
  before_action :require_user, except: [:new, :create]

  def index 
    @crimes = Crime.all.order('created_at ASC')
  end 
  
  def new 
    @crime = Crime.new
  end 
  
  def create 
    @crime = Crime.new(crime_params)
    if @crime.save
      respond_to do|format|
        format.html {redirect_to crimes_path}
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

  def destroy
    @crime.destroy
    respond_to do |format|
      format.html
      format.js {render }
    end
  end
  
  private

  def set_crime
    @crime = Crime.find(params[:id])
  end

  def crime_params
    params.require(:crime).permit(:name, :crime_description, :crime_time, :priority, :resolved, :city_id, :locality_id, :crime_reporter_id)
  end

end