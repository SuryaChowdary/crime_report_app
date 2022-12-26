class CitiesController < ApplicationController

  def index
    @city = City.all
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
      flash[:notice] = "City was Added Successfully"
      redirect_to cities_path(@city)
    else
      render 'new'
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update(params.require(:city).permit(:name))
      flash[:notice] = "City details were edited successfully"
      redirect_to cities_path(@city)
    else
      render 'edit'
    end
  end

    def destroy
      @city = City.find(params[:id])
      if @city.destroy
        flash[:notice] = "City was deleted Successfully"
        redirect_to cities_path
      end
    end

end