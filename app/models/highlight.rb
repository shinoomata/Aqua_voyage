class Highlight < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
