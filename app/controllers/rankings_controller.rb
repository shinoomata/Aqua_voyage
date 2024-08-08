class RankingsController < ApplicationController
  def index
    @top_aquariums = Aquarium.left_joins(:reviews).
                     group('aquaria.id').
                     order('COUNT(reviews.id) DESC').
                     limit(10)

    @top_users = User.left_joins(:reviews).
                 group('users.id').
                 order('COUNT(reviews.id) DESC').
                 limit(10)
  end
end
