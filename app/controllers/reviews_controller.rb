class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_aquarium
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
    @target_audiences = TargetAudience.all
    @size_ratings = SizeRating.all
    @highlights = Highlight.all
  end

  def create
    @review = @aquarium.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @aquarium, notice: 'レビューが正常に投稿されました。'
    else
      @target_audiences = TargetAudience.all
      @size_ratings = SizeRating.all
      @highlights = Highlight.all
      render :new
    end
  end

  def edit
    @target_audiences = TargetAudience.all
    @size_ratings = SizeRating.all
    @highlights = Highlight.all
  end

  def update
    if @review.update(review_params)
      redirect_to @aquarium, notice: 'レビューが更新されました。'
    else
      @target_audiences = TargetAudience.all
      @size_ratings = SizeRating.all
      @highlights = Highlight.all
      render :edit
    end
  end

  private

  def set_aquarium
    @aquarium = Aquarium.find(params[:aquarium_id])
  end

  def set_review
    @review = @aquarium.reviews.find(params[:id])
  end

  def correct_user
    unless @review.user == current_user
      redirect_to @aquarium, alert: "編集権限がありません。"
    end
  end

  def review_params
    params.require(:review).permit(:content, :target_audience_id, :size_rating_id, :highlight_id, :image_url)
  end
end
