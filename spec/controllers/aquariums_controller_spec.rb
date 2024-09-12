require 'rails_helper'

RSpec.describe AquariumsController, type: :controller do
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
    end

  describe "GET index with tag filter" do
    it "filters aquariums by tag" do
      aquarium_with_tag = Aquarium.create!(name: "Tagged Aquarium", location: "Somewhere")
      aquarium_with_tag.tag_list.add("ペンギン")
      aquarium_with_tag.save

      aquarium_without_tag = Aquarium.create!(name: "Untagged Aquarium", location: "Nowhere")

      get :index, params: { tagged_with: "ペンギン" }

      expect(assigns(:aquariums)).to include(aquarium_with_tag)
      expect(assigns(:aquariums)).not_to include(aquarium_without_tag)
    end
  end
end