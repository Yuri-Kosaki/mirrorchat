class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

  private
  def room_params
    params.require(:room).permit(chats_attributes: [:text, :image, :created_at])
  end

  def update_room_params
    params.require(:room).permit(chats_attributes: [:text, :image, :created_at, :_destroy, :id])
  end
end
