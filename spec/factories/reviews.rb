# spec/factories/reviews.rb
FactoryBot.define do
    factory :review do
      content { "素晴らしい体験でした" }
      association :user
      association :aquarium
  
      # 必要に応じて他の関連モデルも設定します
      target_audience { create(:target_audience) }
      size_rating { create(:size_rating) }
      highlight { create(:highlight) }
    end
  end
  