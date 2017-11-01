class BuildingsController < ApplicationController

  def index
    @groups = Group.order("created_at ASC")
    @users = User.order("created_at ASC")
    @buildings = Building.order("created_at ASC").page(params[:page]).per(5)
  end

  def new
    @groups = Group.order("created_at ASC")
    @users = User.order("created_at ASC")
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to buildings_path
    end
  end

  def edit
    @groups = Group.order("created_at ASC")
    @users = User.order("created_at ASC")
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])

    if @building.update(building_params)
      redirect_to buildings_path
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
      redirect_to buildings_path
  end


  private
  def building_params
    params.require(:building).permit(:facility, :explanation, :access, :telephone_number)
  end
end
