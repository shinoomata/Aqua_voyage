class AquariumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @q = Aquarium.ransack(params[:q] )
    @aquariums = @q.result(distinct: true)
  end

  def show
    @aquariums = Aquarium.find(params[:id])
  end
end
