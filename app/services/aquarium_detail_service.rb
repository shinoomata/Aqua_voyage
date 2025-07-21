# app/services/aquarium_detail_service.rb
class AquariumDetailService
  def initialize(aquarium, user = nil)
    @aquarium = aquarium
    @user = user
  end

  def reviews_with_associations
    @aquarium.reviews.includes(:user, :target_audience, :size_rating, :highlight)
  end

  def user_has_reviewed?
    @user && @aquarium.reviews.exists?(user_id: @user.id)
  end

  def photo_urls
    # Google API 使用をやめ、レビューに添付された画像のみ返す
    @aquarium.reviews.where.not(image_url: [nil, '']).pluck(:image_url)
  end
end
