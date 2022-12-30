class LocalitiesController < ApplicationController

  before_action :set_locality , only: [:show, :edit,:update, :destroy]
  before_action :require_user, :localities
  def index 
    @locality = Locality.all
  end 
  
  def new 
    @locality = Locality.new
  end 
  
  def create 
    @locality = Locality.new(locality_params)
    if @locality.save
      flash[:notice] = "Locality name is added successfully"
      redirect_to  localities_path(@locality)
    else 
      render 'new'
    end
  end 

  def show 

  end

  def edit

  end

  def update
    if @locality.update(locality_params)
      flash[:notice] = "Locality name Edited Successfully"
      redirect_to  localities_path(@locality)
    else 
      render 'edit'
    end 
  end

  def destroy
    @locality.destroy
    redirect_to localities_path
  end
  
  private

  def set_locality
    @locality = Locality.find(params[:id])
  end

  def locality_params
    params.require(:locality).permit(:street , :city_id)
  end

end