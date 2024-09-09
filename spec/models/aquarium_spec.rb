require 'rails_helper'

RSpec.describe Aquarium, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it "allows adding tags to an aquarium" do
    aquarium = Aquarium.create!(name: "テスト水族館", location: "テスト所在地")
    aquarium.tag_list.add("ペンギン", "イルカ")
    aquarium.save

    expect(aquarium.tag_list).to include("ペンギン", "イルカ")
  end

  it "finds aquariums by tag" do
    aquarium = Aquarium.create!(name: "テスト水族館", location: "テスト所在地")
    aquarium.tag_list.add("ペンギン")
    aquarium.save

    tagged_aquariums = Aquarium.tagged_with("ペンギン")
    expect(tagged_aquariums).to include(aquarium)
  end
end