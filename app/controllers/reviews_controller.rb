class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_aquarium

  def new
    @review = Review.new
  end

  def create
    @review = @aquarium.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @aquarium, notice: 'レビューが作成されました。'
    else
      render :new
    end
  end

  private

  def set_aquarium
    @aquarium = Aquarium.find(params[:aquarium_id])
  end

  def review_params
    params.require(:review).permit(:content, :target_audience_id, :size_rating_id, :highlight_id, :image_url)
  end
end
