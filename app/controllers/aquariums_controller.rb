class AquariumsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @q = Aquarium.ransack(params[:q])
    @regions = Aquarium.distinct.pluck(:region)
    @aquariums = @q.result(distinct: true)
  end

  def show
    @aquarium = Aquarium.find_by(id: params[:id])
    if @aquarium
      @reviews = @aquarium.reviews.includes(:user, :target_audience, :size_rating, :highlight)
      Rails.logger.debug "Aquarium found: #{@aquarium.inspect}"
    else
      Rails.logger.debug "Aquarium not found for id: #{params[:id]}"
      flash[:alert] = "Aquarium not found"
      redirect_to aquariums_path
    end
  end
end
