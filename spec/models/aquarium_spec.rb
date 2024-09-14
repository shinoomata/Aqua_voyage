require 'rails_helper'

RSpec.describe Aquarium, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:target_audience) { TargetAudience.create!(content: "どっちも") }
  let(:size_rating) { SizeRating.create!(size: "どっちも") }
  let(:highlight) { Highlight.create!(highlight_kind: "どっちも") }
  let!(:aquarium) { Aquarium.create!(name: "Unique Aquarium #{SecureRandom.uuid}", location: "Test Location") }

  it "水族館にタグを追加できる" do
    aquarium = Aquarium.create!(name: "テスト水族館", location: "テスト所在地")
    aquarium.tag_list.add("ペンギン", "イルカ")
    aquarium.save

    expect(aquarium.tag_list).to include("ペンギン", "イルカ")
  end

  it "タグで水族館を検索できる" do
    aquarium = Aquarium.create!(name: "テスト水族館", location: "テスト所在地")
    aquarium.tag_list.add("ペンギン")
    aquarium.save

    tagged_aquariums = Aquarium.tagged_with("ペンギン")
    expect(tagged_aquariums).to include(aquarium)
  end

  it "名前がユニークである場合は有効である" do
    aquarium = Aquarium.new(name: "Unique Aquarium", location: "Some location")
    expect(aquarium).to be_valid
  end

  it "名前がない場合は無効である" do
    aquarium = Aquarium.new(name: nil, location: "Some location")
    expect(aquarium).to_not be_valid
    expect(aquarium.errors[:name]).to include("can't be blank")
  end

  it "重複した名前がある場合は無効である" do
    Aquarium.create(name: "Duplicate Aquarium", location: "Location 1")
    aquarium = Aquarium.new(name: "Duplicate Aquarium", location: "Location 2")
    expect(aquarium).to_not be_valid
    expect(aquarium.errors[:name]).to include("has already been taken")
  end

  describe "アソシエーション" do
    it "like_aquariaを持ち、削除時に依存関係も削除される" do
       # aquariumがbeforeブロックで作成されるので、ここで参照可能
       review = aquarium.reviews.create!(
        user: user,
        content: "Great aquarium!",
        target_audience_id: target_audience.id,
        size_rating_id: size_rating.id,
        highlight_id: highlight.id,
      )

      expect(aquarium.reviews).to include(review)
      
      # 削除時に依存関係も削除されるか確認
      expect { aquarium.destroy }.to change { Review.count }.by(-1)
    end

    it "like_aquariaを介してliked_by_usersを持つ" do
      user = FactoryBot.create(:user)
      aquarium.like_aquaria.create!(user: user)

      expect(aquarium.liked_by_users).to include(user)
    end

    it "reviewsを持ち、削除時に依存関係も削除される" do
      review = aquarium.reviews.create!(
        user: user,
        content: "Great aquarium!",
        target_audience: target_audience,
        size_rating: size_rating,
        highlight: highlight,
      )

      expect(aquarium.reviews).to include(review)

      # 削除時に依存関係も削除されるか確認
      expect { aquarium.destroy }.to change { Review.count }.by(-1)
    end
  end

  describe ".ransackable_attributes" do
    it "ransackで使用可能な正しい属性を返す" do
      expect(Aquarium.ransackable_attributes).to include("name", "location", "region")
    end
  end

  describe ".ransackable_associations" do
    it "ransackで使用可能な関連を空の配列として返す" do
      expect(Aquarium.ransackable_associations).to eq([])
    end
  end

  it "削除されると関連するlike_aquariaも削除される" do
    aquarium = Aquarium.create!(name: "Test Aquarium", location: "Test Location")

  review = Review.create!(
    user: user,
    aquaria_id: aquarium.id, 
    content: "Great aquarium!",
    target_audience_id: target_audience.id, 
    size_rating_id: size_rating.id,
    highlight_id: highlight.id,
  )

  expect(aquarium.reviews).to include(review)

  # ここで `LikeAquarium` に依存関係を持つテストを行う
  like = LikeAquarium.create!(user: user, aquarium: aquarium)
  expect { aquarium.destroy }.to change { LikeAquarium.count }.by(-1)
  end

  it "削除されると関連するreviewsも削除される" do
    aquarium = Aquarium.create!(name: "Test Aquarium", location: "Test Location")
    target_audience = TargetAudience.create!(content: "どっちも")
    size_rating = SizeRating.create!(size: "どっちも")
    highlight = Highlight.create!(highlight_kind: "どっちも")

    review = aquarium.reviews.create!(
      user: FactoryBot.create(:user),
      content: "Great aquarium!",
      target_audience: target_audience,
      size_rating: size_rating,
      highlight: highlight
    )

    expect { aquarium.destroy }.to change { Review.count }.by(-1)
  end
end