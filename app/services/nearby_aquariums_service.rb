class NearbyAquariumsService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def fetch_nearby_aquariums
    Aquarium.
      select("*, earth_distance(ll_to_earth(latitude, longitude), ll_to_earth(#{@latitude}, #{@longitude})) AS distance").
      order("distance ASC")
  end
end
