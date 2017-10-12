class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @groups = Group.order("created_at ASC")
    @message = Message.new
    @group__search = Group.new
  end

  def create
    @message = Message.new(message_params)
    @group = Group.find(params[:group_id])

    if @message.save
      redirect_to group_messages_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end
end
