class Review < ApplicationRecord
  belongs_to :user
  belongs_to :aquarium
  belongs_to :target_audience
  belongs_to :size_rating
  belongs_to :highlight
end

class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
end

class Aquarium < ApplicationRecord
  has_many :reviews, foreign_key: 'aquaria_id', dependent: :destroy
end

class TargetAudience < ApplicationRecord
  has_many :reviews, dependent: :destroy
end

class SizeRating < ApplicationRecord
  has_many :reviews, dependent: :destroy
end

class Highlight < ApplicationRecord
  has_many :reviews, dependent: :destroy
end