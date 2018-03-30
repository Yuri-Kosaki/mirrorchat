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
  end

  def update
  end

  def destroy
  end

  private
  def timeline_params
    params.require(:timeline).permit(:text, :image)
  end

  def update_timeline_params
  end
end
