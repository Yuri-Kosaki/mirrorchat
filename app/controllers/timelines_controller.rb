class TimelinesController < ApplicationController

  def index
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")
    @timeline = Timeline.new
    @timelines = Timeline.order("created_at DESC")
    @review = Review.new
  end

  def create
    @timeline = Timeline.new(timeline_params)

    if @timeline.save
      redirect_to timelines_path
    end
  end

  def edit
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")
    @timeline = Timeline.find(params[:id])
  end

  def update
    @timeline = Timeline.find(params[:id])

    if @timeline.update(timeline_params)
      redirect_to timelines_path
    end
  end

  def destroy
    @timeline = Timeline.find(params[:id])

    if @timeline.destroy
      redirect_to timelines_path
    end

  end

  private
  def timeline_params
    params.require(:timeline).permit(:text, :image, reviews_attributes: [:text, :image, :created_at]).merge(user_id: current_user.id)
  end

  def update_timeline_params
    params.require(:timeline).permit(:text, :image, reviews_attributes: [:text, :image, :created_at, :updated_at, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
