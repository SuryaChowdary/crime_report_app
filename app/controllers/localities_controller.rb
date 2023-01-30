class LocalitiesController < ApplicationController

  before_action :set_locality , only: [:show, :edit,:update, :destroy]
  before_action :require_user
  
  def index 
    @localities = Locality.all.order('created_at ASC')
  end 
  
  def new 
    @locality = Locality.new
  end 
  
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

  def show 

  end

  def edit

  end

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

  def destroy
    @locality.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private

  def set_locality
    @locality = Locality.find(params[:id])
  end

  def locality_params
    params.require(:locality).permit(:name , :city_id)
  end

end