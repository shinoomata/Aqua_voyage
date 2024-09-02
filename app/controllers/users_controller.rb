class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update]  # ログインが必要
  before_action :set_user, only: %i[update show edit]
  before_action :check_admin, only: [:destroy]

  def show
    @user = current_user
    # 必要に応じて、レビューやその他のユーザー関連情報を取得
    @reviews = @user.reviews.includes(:aquarium).order(created_at: :desc)
    # お気に入りの水族館を取得
    @liked_aquariums = @user.liked_aquariums.includes(:reviews)
  end

  def edit
    # @userはset_userで設定されるので、特に何もする必要はありません
  end

  def update
    Rails.logger.debug { "Updating user: #{@user.inspect}" }
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー名が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'ユーザーを削除しました。'
  end

  private

  def check_admin
    redirect_to root_path, alert: '権限がありません。' unless current_user.admin?
  end

  def set_user
    @user = current_user
    Rails.logger.debug { "Set user: #{@user.inspect}" }
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
