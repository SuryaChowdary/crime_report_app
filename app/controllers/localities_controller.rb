class LocalitiesController < ApplicationController

  before_action :set_locality , only: [:show, :edit,:update, :destroy]
  before_action :require_user
  
  #Display List of all Localities
  def index 
    @localities = Locality.all.order('created_at ASC')
  end 
  
  # Add new Locality
  def new 
    @locality = Locality.new
  end 
  
  # Save new Locality
  def create 
    @locality = Locality.new(locality_params)
    if @locality.save
      respond_to do|format|
        format.html {redirect_to localities_path}
        format.js {render :content_type => 'application/javascript'}
      end
    else
      respond_to do|format|
        format.js {render 'errors'}
      end
    end
  end 

  # Details of specific Locality
  def show 

  end

  # Edit specific Locality
  def edit

  end

  # Update specific Locality
  def update
    if @locality.update(locality_params)
      respond_to do |format|
        format.html { redirect_to @locality, notice: 'Locality details was successfully updated.' }
        format.js { render :content_type => 'application/javascript' }
      end
    else
      respond_to do |format|
        format.js { render 'errors' }
      end
    end 
  end

  # Delete specific Locality
  def destroy
    @locality.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private

  # private method to find locality with its id 
  def set_locality
    @locality = Locality.find(params[:id])
  end

  # private method to pass locality paramteres for adding and editing locality
  def locality_params
    params.require(:locality).permit(:name , :city_id)
  end

end