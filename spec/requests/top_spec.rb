require 'rails_helper'

RSpec.describe "Tops", type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end
  
  describe "GET /index" do
    it "returns http success" do
      get "/top/index"
      expect(response).to have_http_status(:success)
    end
  end
end
