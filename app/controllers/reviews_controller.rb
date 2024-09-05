class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:latest]
  before_action :set_aquarium, only: %i[new create edit update destroy]
  before_action :set_review, only: %i[edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @reviews = @aquarium.reviews
    @target_audience_data = @reviews.group(:target_audience_id).count
    @size_rating_data = @reviews.group(:size_rating_id).count
    @highlight_data = @reviews.group(:highlight_id).count
  end

  def new
    @review = Review.new
    load_review_resources
  end

  def create
    @review = @aquarium.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      # 水族館にタグを追加
      if params[:aquarium][:tag_list].present?
        @aquarium.tag_list = params[:aquarium][:tag_list]
        @aquarium.save
        Rails.logger.debug "Saved tags: #{@aquarium.tag_list}"
      end

      redirect_to @aquarium, notice: 'レビューが正常に投稿されました。'
    else
      load_review_resources
      flash.now[:alert] = "全ての項目を選択してください"
      render :new
    end
  end

  def edit
    load_review_resources
  end

  def update
    if @review.update(review_params)
      # タグの更新
      if params[:aquarium][:tag_list].present?
        @aquarium.tag_list = params[:aquarium][:tag_list]
        @aquarium.save
        Rails.logger.debug "Updated tags: #{@aquarium.tag_list}"
      end

      redirect_to @aquarium, notice: 'レビューが正常に更新されました。'
    else
      load_review_resources
      flash.now[:alert] = "全ての項目を選択してください"
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:notice] = "レビューを削除しました"
    redirect_to @aquarium, status: :see_other
  end

  def latest
    @reviews = Review.includes(:aquarium).order(created_at: :desc).limit(20) # 最新の20件のレビューを取得
    @chat_bubble_colors = %w[chat-bubble-primary chat-bubble-secondary chat-bubble-accent chat-bubble-info chat-bubble-success chat-bubble-warning chat-bubble-error]
  end

  private

  def load_review_resources
    @target_audiences = TargetAudience.all
    @size_ratings = SizeRating.all
    @highlights = Highlight.all
  end

  def set_aquarium
    @aquarium = Aquarium.find(params[:aquarium_id])
  end

  def set_review
    @review = @aquarium.reviews.find(params[:id])
  end

  def correct_user
    redirect_to @aquarium, alert: "編集権限がありません。" unless @review.user == current_user
  end

  def review_params
    params.require(:review).permit(:content, :target_audience_id, :size_rating_id, :highlight_id, :tag_list, :image_url, :remove_image_url)
  end
end
