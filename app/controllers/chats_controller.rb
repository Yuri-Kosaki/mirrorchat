class ChatsController < ApplicationController

  def index
    @groups = Group.order("created_at ASC")
    @room = Room.find(params[:room_id])
    @chats = @room.chats.order("created_at ASC").includes(:user)
    @rooms = Room.order("created_at ASC")
    @chat = Chat.new
  end

  def create
    @user_chat = Chat.new(chat_params)
    @room = Room.find(params[:room_id])

    if @user_chat.save
      redirect_to room_chats_path(@room)
    end
  end

  def edit
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")
    @chat = Chat.find(params[:id])
  end

  def update
    @chat = Chat.find(params[:id])

    if @chat.update
      redirect_to room_chats_path
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to room_chats_path
  end

  private
  def chat_params
    params.require(:chat).permit(:text, :image).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
