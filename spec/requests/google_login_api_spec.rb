require 'rails_helper'

RSpec.describe "GoogleLoginApis", type: :request do
  describe "GET /callback" do
    it "returns http success" do
      get "/google_login_api/callback"
      expect(response).to have_http_status(:success)
    end
  end

end
