class MessagesController < ApplicationController


  def index
    @group = Group.find(params[:group_id])
    @users = User.order("created_at ASC")
    @groups = Group.order("created_at ASC")
    @message = Message.new
  end

  def chat
    @users = User.order("created_at ASC")
    @groups = Group.order("created_at ASC")
    @message = Message.new
  end

  def create
    @group_message = Message.new(message_params)
    @group = Group.find(params[:group_id])

    if @group_message.save
      redirect_to group_messages_path(@group)
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    if @message.update
      redirect_to group_messages_path
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to group_messages_path
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
