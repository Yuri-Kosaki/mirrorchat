class UsersController < ApplicationController

  def index
    @users = User.order("created_at ASC")
    @groups = Group.order("created_at ASC")
    @user = User.find(params[:id])
    @message = Message.new
    @group__search = Group.new
  end
end
