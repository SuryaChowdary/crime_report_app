class CitizensController < ApplicationController

  before_action :authenticate_user!, except: [:new, :create, :update_locality]
  
  # To add/report new crime without user
  def new
    @crime = Crime.new
  end
  
  # Save the crime details to crimes database
  def create
    @crime = Crime.new(crime_params)
    if @crime.save
    flash[:notice] = "Crime was successfully reported."
    redirect_to root_path
    else
      render new
    end
  end

  # Fetch localities for selected cities 
  def update_locality
    @localities = Locality.where(city_id: params[:cities])
    respond_to do |format|
      format.js { render :update_locality }
    end
  end
  
  private
  
  # private method to pass parameters to save crime details
  def crime_params
    params.require(:crime).permit( :crime_description, :city_id, :crime_time, :locality_id, :priority, :resolved)
  end

end
