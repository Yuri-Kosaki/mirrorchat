class MessagesController < ApplicationController


  def index
    @group = Group.find(params[:group_id])
    @users = User.order("created_at ASC")
    @groups = Group.order("created_at ASC")
    @message = Message.new
    @messages = @group.messages.order(created_at: :DESC).includes(:user)

    respond_to do |format|
      format.html
      format.json
    end
  end

  def chat
    @users = User.order("created_at ASC")
    @groups = Group.order("created_at ASC")
    @message = Message.new
    @user = User.find(params[:user_id])
  end

  def create
    @group_message = Message.new(message_params)
    @group = Group.find(params[:group_id])

    if @group_message.save
      respond_to do |format|
        format.html { redirect_to :group_messages, notice: "メッセージを更新しました。" }
        format.json
      end
    else
      render :index
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
