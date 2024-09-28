class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review

  def create
    @reply = @review.replies.build(reply_params)
    @reply.user = current_user

    if @reply.save
      redirect_to aquarium_path(@review.aquarium), notice: '返信が投稿されました。'
    else
      redirect_to aquarium_path(@review.aquarium), alert: '返信の投稿に失敗しました。'
    end
  end

  def edit
  end

  def update
    if @reply.update(reply_params)
      redirect_to aquarium_path(@review.aquarium), notice: '返信が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @reply = @review.replies.find(params[:id])
    @reply.destroy
    redirect_to aquarium_path(@review.aquarium), notice: '返信が削除されました。'
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end

  def set_reply
    @reply = @review.replies.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:content)
  end
end
