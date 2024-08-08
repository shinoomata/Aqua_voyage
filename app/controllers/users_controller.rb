class UsersController < ApplicationController
  before_action :authenticate_user!  # ログインが必要

  def show
    @user = current_user
    # 必要に応じて、レビューやその他のユーザー関連情報を取得
    @reviews = @user.reviews.includes(:aquarium).order(created_at: :desc)
  end
end
