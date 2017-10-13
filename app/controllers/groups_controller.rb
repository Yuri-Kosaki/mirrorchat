class GroupsController < ApplicationController

  def index
    @group = Group.new
    @groups = Group.order("created_at ASC")
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
