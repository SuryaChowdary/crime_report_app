class CitiesController < ApplicationController
  
  before_action :require_user

  def index
    @cities = City.all.order('created_at ASC')
  end

  def show
    @city = City.find(params[:id])
  end

  def new 
    @city = City.new
  end

  def create 
    @city = City.new(params.require(:city).permit(:name))
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

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update(params.require(:city).permit(:name))
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

    def destroy
      @city = City.find(params[:id])
      if @city.destroy
        respond_to do |format|
          format.html
          format.js {render }
        end
      end
    end

end