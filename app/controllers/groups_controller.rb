class GroupsController < ApplicationController

  def index
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")

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

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(update_group_params)
      redirect_to group_messages_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
      @group.destroy
      redirect_to root_path
  end

  def show
    @group = Group.find(params[:id])
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")
  end

  private
  def group_params
    params.require(:group).permit(:name, :image, :introduction, :status)
  end

  def update_group_params
    params.require(:group).permit(:name, :image, :introduction, :status, messages_attributes: [:text, :image, :created_at, :_destroy, :id])
  end
end
