class TargetAudience < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
