class UsersController < ApplicationController

  def index
    @users = User.order("created_at ASC")
    @groups = Group.order("created_at ASC")
    @user = User.find(params[:id])
    @message = Message.new
    @group__search = Group.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(update_user_params)
      redirect_to chat_user_messages_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
  end


  private
  def update_user_params
    params.require(:user).permit(:name, :hobby, :place, :year, messages_attributes: [:text, :created_at, :_destroy, :id])
  end
end
