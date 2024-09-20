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
        client = GooglePlaces::Client.new(ENV['GOOGLE_MAPS_API_KEY'])
        place = client.spots_by_query(@aquarium.name).first
        place&.photos&.any? ? place.photos.map { |photo| photo.fetch_url(800) } : []
      end
  end
  