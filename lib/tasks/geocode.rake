namespace :aquarium do
  desc "Geocode all aquariums"
  task geocode: :environment do
    require 'net/http'
    require 'json'

    api_key = ENV['GOOGLE_MAPS_API_KEY']

    def get_lat_lng(address, api_key)
      url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode_www_form_component(address)}&key=#{api_key}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      json = JSON.parse(response)
      if json['results'].any?
        location = json['results'][0]['geometry']['location']
        return location['lat'], location['lng']
      else
        puts "Could not geocode address: #{address}"
        return nil, nil
      end
    end

    Aquarium.find_each do |aquarium|
      if aquarium.latitude.nil? || aquarium.longitude.nil?
        lat, lng = get_lat_lng(aquarium.location, api_key)
        if lat && lng
          aquarium.update(latitude: lat, longitude: lng)
          puts "Updated #{aquarium.name} with latitude: #{lat}, longitude: #{lng}"
        end
      end
    end
  end
end
