class ReviewsController < ApplicationController

  def index
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")
    @timeline = Timeline.find(params[:timeline_id])
    @review = Review.new
  end

  def create
    @timeline = Timeline.find(params[:timeline_id])
    @review = Review.new(review_params)

    if @review.save
      redirect_to timeline_reviews_path(@timeline)
    end
  end

  def edit
    @groups = Group.order("created_at ASC")
    @rooms = Room.order("created_at ASC")
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to timeline_reviews_path(@review.timeline_id)
    end
  end

  private
  def review_params
    params.require(:review).permit(:text, :image).merge(timeline_id: params[:timeline_id], user_id: current_user.id)
  end
end
