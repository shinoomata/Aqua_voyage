# app/controllers/admin/reviews_controller.rb
class Admin::ReviewsController < Admin::BaseController
  def index
    @reviews = Review.includes(:user, :aquarium).all
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path, notice: 'レビューを削除しました'
  end
end

