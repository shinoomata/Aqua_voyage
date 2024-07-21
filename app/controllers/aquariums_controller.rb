class AquariumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @q = Aquarium.ransack(params[:q])
    @regions = Aquarium.distinct.pluck(:region)
    @aquariums = @q.result(distinct: true)
  end

  def show
    @aquarium = Aquarium.find_by(id: params[:id])
    if @aquarium
      Rails.logger.debug "Aquarium found: #{@aquarium.inspect}"
    else
      Rails.logger.debug "Aquarium not found for id: #{params[:id]}"
      flash[:alert] = "Aquarium not found"
      redirect_to aquariums_path
    end
  end
end
