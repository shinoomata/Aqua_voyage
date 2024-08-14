class UsersController < ApplicationController
  before_action :authenticate_user!  # ログインが必要
  before_action :check_admin, only: [:destroy]

  def show
    @user = current_user
    # 必要に応じて、レビューやその他のユーザー関連情報を取得
    @reviews = @user.reviews.includes(:aquarium).order(created_at: :desc)
    # お気に入りの水族館を取得
    @liked_aquariums = @user.liked_aquariums.includes(:reviews)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'ユーザーを削除しました。'
  end

  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: '権限がありません。'
    end
  end
end
