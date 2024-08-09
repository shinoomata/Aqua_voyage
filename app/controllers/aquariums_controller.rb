require 'google_places'

class AquariumsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @q = Aquarium.ransack(params[:q])

    # まずはすべての地域を取得して一意にし、nilを除外します
    @regions = Aquarium.distinct.pluck(:region).compact
    # 北から南の順にソートします
    region_order = %w[北海道 東北 関東 東海 北陸 近畿 中国 四国 九州 沖縄]
    @regions = @regions.sort_by { |region| region_order.index(region) || Float::INFINITY }
    @aquariums = @q.result(distinct: true)

    # タグでフィルタリング
    if params[:tag]
      @aquariums = Aquarium.tagged_with(params[:tag])
    else
      @aquariums = @q.result(distinct: true)
    end

    @search_keyword = params.dig(:q, :name_or_location_or_description_cont)
    @selected_region = params.dig(:q, :region_eq)
  end

  def show
    @aquarium = find_aquarium
    if @aquarium
      prepare_reviews_and_data
      prepare_photo_urls
      @tags = @aquarium.tag_list # タグ情報を準備
      log_aquarium_info
    else
      handle_aquarium_not_found
    end
  end

  private

  def find_aquarium
    Aquarium.find_by(id: params[:id]).tap do |_aquarium|
      Rails.logger.debug "GOOGLE_MAPS_API_KEY: #{ENV['GOOGLE_MAPS_API_KEY']}"
    end
  end

  def prepare_reviews_and_data
    @reviews = @aquarium.reviews.includes(:user, :target_audience, :size_rating, :highlight)
    @target_audience_data = @reviews.group(:target_audience_id).count
    @size_rating_data = @reviews.group(:size_rating_id).count
    @highlight_data = @reviews.group(:highlight_id).count

    if user_signed_in?
      @user_has_reviewed = @reviews.exists?(user_id: current_user.id)
    else
      store_location_for(:user, request.fullpath)
    end
  end

  def prepare_photo_urls
    client = GooglePlaces::Client.new(ENV['GOOGLE_MAPS_API_KEY'])
    place = client.spots_by_query(@aquarium.name).first

    @photo_urls = if place&.photos&.any?
                    place.photos.map { |photo| photo.fetch_url(800) }
                  else
                    []
                  end
  end

  def log_aquarium_info
    Rails.logger.debug "Aquarium found: #{@aquarium.inspect}"
  end

  def handle_aquarium_not_found
    Rails.logger.debug "Aquarium not found for id: #{params[:id]}"
    flash[:alert] = "Aquarium not found"
    redirect_to aquariums_path
  end
end
