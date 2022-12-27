class CrimesController < ApplicationController

  before_action :set_crime , only: [:show, :edit,:update, :destroy]

  def index 
    @crime = Crime.all
  end 
  
  def new 
    @crime = Crime.new
  end 
  
  def create 
    @crime = Crime.new(crime_params)
    if @crime.save
      flash[:notice] = "Crime name is added successfully"
      redirect_to  crimes_path(@crime)
    else 
      render 'new'
    end
  end 

  def show 
  end

  def edit

  end

  def update
    if @crime.update(crime_params)
      flash[:notice] = "Crime name Edited Successfully"
      redirect_to  crimes_path(@crime)
    else 
      render 'edit'
    end 
  end

  def destroy
    @crime.destroy
    redirect_to crimes_path
  end
  
  private

  def set_crime
    @crime = Crime.find(params[:id])
  end

  def crime_params
    params.require(:crime).permit(:name, :crime_description, :crime_time, :priority, :resolved, :city_id, :locality_id, :crime_reporter_id)
  end

end