require 'rails_helper'

before do
  user = FactoryBot.create(:user)
  sign_in user
end

RSpec.describe "Aquariums", type: :request do
  describe "GET /index" do
    let!(:aquarium_with_tag) { create(:aquarium, tags: ["ペンギン"]) }
    
    it "filters aquariums by tag" do
      get aquariums_path, params: { tagged_with: "ペンギン" }
      expect(response).to have_http_status(:success)
      expect(response.body).to include(aquarium_with_tag.name)
    end
  end
end