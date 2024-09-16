require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:aquarium) { FactoryBot.create(:aquarium) }
  let(:target_audience) { FactoryBot.create(:target_audience) }
  let(:size_rating) { FactoryBot.create(:size_rating) }
  let(:highlight) { FactoryBot.create(:highlight) }

  # バリデーションのテスト
  it "有効なレビューを作成できる" do
    review = Review.new(
      user:,
      aquarium:,
      target_audience:,
      size_rating:,
      highlight:,
      content: "素晴らしい水族館！"
    )
    expect(review).to be_valid
  end

  it "同じユーザーが同じ水族館に2回レビューを投稿できない" do
    Review.create!(
      user:,
      aquarium:,
      target_audience:,
      size_rating:,
      highlight:,
      content: "素晴らしい水族館！"
    )
    duplicate_review = Review.new(
      user:,
      aquarium:,
      target_audience:,
      size_rating:,
      highlight:,
      content: "もう一度投稿"
    )
    expect(duplicate_review).to_not be_valid
    expect(duplicate_review.errors[:user_id]).to include("はこの水族館に既にレビューを投稿しています")
  end

  it "target_audience_idがない場合は無効である" do
    review = Review.new(
      user:,
      aquarium:,
      size_rating:,
      highlight:,
      content: "素晴らしい水族館！"
    )
    expect(review).to_not be_valid
  end

  # アソシエーションのテスト
  it { should belong_to(:user) }
  it { should belong_to(:aquarium) }
  it { should belong_to(:target_audience) }
  it { should belong_to(:size_rating) }
  it { should belong_to(:highlight) }
  it { should have_many(:replies).dependent(:destroy) }
end
