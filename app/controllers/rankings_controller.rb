class RankingsController < ApplicationController
  def index
    @top_aquariums = rank_aquariums
    @top_users = rank_users
  end

  private

  def rank_aquariums
    Aquarium.left_joins(:reviews)
            .group('aquaria.id')
            .select('aquaria.*, COUNT(reviews.id) as reviews_count')
            .having('COUNT(reviews.id) > 0')
            .order('reviews_count DESC')
  end

  def rank_users
    User.left_joins(:reviews)
        .group('users.id')
        .select('users.*, COUNT(reviews.id) as reviews_count')
        .having('COUNT(reviews.id) > 1')
        .order('reviews_count DESC')
  end
end
