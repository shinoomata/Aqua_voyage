class Review < ApplicationRecord
  belongs_to :user
  belongs_to :aquarium, class_name: 'Aquarium', foreign_key: 'aquaria_id'
  belongs_to :target_audience
  belongs_to :size_rating
  belongs_to :highlight

  validates :user_id, uniqueness: { scope: :aquaria_id, message: "はこの水族館に既にレビューを投稿しています" }
  validates :target_audience_id, presence: true
  validates :size_rating_id, presence: true
  validates :highlight_id, presence: true
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