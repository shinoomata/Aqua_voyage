# app/controllers/admin/users_controller.rb
class Admin::UsersController < Admin::BaseController
  def index
    @users = User.includes(:reviews).all
  end

  def destroy_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを削除しました'
  end

  def destroy_review
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_users_path, notice: 'レビューを削除しました'
  end
end

