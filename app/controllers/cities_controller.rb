class CitiesController < ApplicationController
  
  before_action :set_city, only: [:show, :edit,:update, :destroy]
  before_action :require_user

  # Display a list of all cities
  def index
    @cities = City.all.order('created_at ASC')
  end

  # Display details of specific city 
  def show

  end

  # Add new City
  def new 
    @city = City.new
  end

  # Save new city
  def create 
    @city = City.new(city_params)
    if @city.save
      respond_to do|format|
        format.html {redirect_to cities_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end 
  end

  # Edit specific city
  def edit

  end

  # Update specific city details
  def update
    if @city.update(city_params)
      respond_to do |format|
        format.html { redirect_to @city, notice: 'City details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end 
  end

  # Delete specific city by finding its id
  def destroy
    if @city.destroy
      respond_to do |format|
        format.html
        format.js {render }
      end
    end
  end

  private
  
  # private method to find cities by its id
  def set_city
    @city = City.find(params[:id])
  end

  # private method to pass cities parameters for creating and updating cities
  def city_params
    params.require(:city).permit(:name)
  end

end