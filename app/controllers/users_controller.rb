class UsersController < ApplicationController


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

  def show
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")
    @user = User.find(params[:id])
    @new_user = User.new
  end


  private
  def update_user_params
    params.require(:user).permit(:name, :hobby, :place, :year, :image, :role)
  end
end
