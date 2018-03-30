class CommentsController < ApplicationController

  def index
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:message_id])
    @comment = Comment.new
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:message_id])
    @comment = Comment.new
    @message_comment = @message.comments.create(comment_params)

    if @message_comment
        redirect_to group_message_comments_path([@group, @message])
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:message_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to group_message_comments_path([@group, @message])
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :image).merge(group_id: params[:group_id], message_id: params[:message_id], user_id: current_user.id)
  end

  def update_comment_params
  end


end
