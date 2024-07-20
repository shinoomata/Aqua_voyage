class AquariumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @q = Aquarium.ransack(params[:q])
    @regions = Aquarium.distinct.pluck(:region)
    @aquariums = @q.result(distinct: true)
  end

  def show
    @aquariums = Aquarium.find(params[:id])
    unless @aquarium
      flash[:alert] = "Aquarium not found"
      redirect_to aquariums_path
    end
  end
end
