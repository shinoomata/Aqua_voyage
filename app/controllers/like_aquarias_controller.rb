class LikeAquariasController < ApplicationController
  before_action :authenticate_user!

  def create
    @aquarium = Aquarium.find(params[:aquarium_id])
    # `liked_aquariums`が存在するか確認し、正しい関連付けがされているかを確認する
    if current_user.liked_aquariums.include?(@aquarium)
      redirect_to aquarium_path(@aquarium), alert: 'この水族館はすでにお気に入りに追加されています。'
    else
      current_user.liked_aquariums << @aquarium unless current_user.liked_aquariums.include?(@aquarium)
      redirect_to aquarium_path(@aquarium), notice: '水族館をお気に入りに追加しました。'
    end
  end

  def destroy
    @aquarium = Aquarium.find(params[:aquarium_id])
    current_user.liked_aquariums.delete(@aquarium)
    redirect_to aquarium_path(@aquarium), notice: '水族館のお気に入りを解除しました。'
  end
end
