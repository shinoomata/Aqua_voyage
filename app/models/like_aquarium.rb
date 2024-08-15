class LikeAquarium < ApplicationRecord
  self.table_name = 'like_aquaria'
  belongs_to :user
  belongs_to :aquarium
end
