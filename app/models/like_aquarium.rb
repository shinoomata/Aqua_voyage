class LikeAquarium < ApplicationRecord
  self.table_name = 'like_aquarias'
  belongs_to :user
  belongs_to :aquarium
end
