class Aquarium < ApplicationRecord
  self.table_name = 'aquaria'

  has_many :like_aquarias, class_name: 'LikeAquarium', dependent: :destroy
  has_many :liked_by_users, through: :like_aquarias, source: :user
  
  acts_as_taggable_on :tags

  validates :name, presence: true, uniqueness: true
  has_many :reviews, foreign_key: 'aquaria_id', dependent: :destroy
  
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at description id location name region updated_at website]
  end

  def self.ransackable_associations(_auth_object = nil)
    []  # 必要に応じて関連付けを追加します
  end
end
