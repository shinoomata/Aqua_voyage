require 'google_places'

class AquariumsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @q = Aquarium.ransack(params[:q])

    # まずはすべての地域を取得して一意にし、nilを除外します
    @regions = Aquarium.distinct.pluck(:region).compact
    # 北から南の順にソートします
    region_order = %w[北海道 東北 関東 東海 北陸 近畿 中国 四国 九州 沖縄]
    @regions = @regions.sort_by { |region| region_order.index(region) || Float::INFINITY }
    @aquariums = @q.result(distinct: true)

    @search_keyword = params.dig(:q, :name_or_location_or_description_cont)
    @selected_region = params.dig(:q, :region_eq)
  end

  def show
    @aquarium = Aquarium.find_by(id: params[:id])
    Rails.logger.debug "GOOGLE_MAPS_API_KEY: #{ENV['GOOGLE_MAPS_API_KEY']}"
    if @aquarium
      @reviews = @aquarium.reviews.includes(:user, :target_audience, :size_rating, :highlight)
      @target_audience_data = @reviews.group(:target_audience_id).count
      @size_rating_data = @reviews.group(:size_rating_id).count
      @highlight_data = @reviews.group(:highlight_id).count

      if user_signed_in?
        @user_has_reviewed = @reviews.exists?(user_id: current_user.id)
      else
        store_location_for(:user, request.fullpath)
      end

      # Google Places APIを使って写真を取得
      client = GooglePlaces::Client.new(ENV['GOOGLE_MAPS_API_KEY'])
      place = client.spots_by_query(@aquarium.name).first

      if place && place.photos.any?
        @photo_urls = place.photos.map { |photo| photo.fetch_url(800) } # 800は画像の幅（ピクセル）
      else
        @photo_urls = []
      end

      Rails.logger.debug "Aquarium found: #{@aquarium.inspect}"
    else
      Rails.logger.debug "Aquarium not found for id: #{params[:id]}"
      flash[:alert] = "Aquarium not found"
      redirect_to aquariums_path
    end
  end
end
