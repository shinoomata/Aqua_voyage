class SizeRating < ApplicationRecord
    has_many :reviews, dependent: :destroy
  end