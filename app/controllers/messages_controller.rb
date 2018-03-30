class MessagesController < ApplicationController


  def index
    @group = Group.find(params[:group_id])
    @users = User.order("created_at ASC")
    @groups = Group.order("created_at ASC")
    @message = Message.new
    @rooms = Room.order("created_at ASC")
    @group_comment = @group.comments.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @group_message = @group.messages.create(message_params)

    if @group_message.save
      redirect_to group_messages_path(@group)
    else
      render :index
    end
  end


  def edit
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    if @message.update
      redirect_to group_messages_path
    end
  end

  def show
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
    @comment = Comment.new
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
