class CitizensController < ApplicationController
  
  def new
    @crime = Crime.new
  end
  
  def create
    @crime = Crime.new(crime_params)
    if @crime.save
    flash[:notice] = "Crime was successfully reported."
    redirect_to root_path
    else
      render new
    end
  end
  
  private
  
  def crime_params
    params.require(:crime).permit( :crime_description, :city_id, :crime_time, :locality_id, :priority, :resolved)
  end

end
