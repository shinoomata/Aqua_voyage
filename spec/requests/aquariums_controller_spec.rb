require 'rails_helper'

RSpec.describe AquariumsController, type: :request do
  let!(:aquarium) { create(:aquarium) }
  let!(:review) { create(:review, aquarium:, content: '素晴らしい体験でした') }

  before(:each) do
    @user = User.find_or_create_by(email: 'test@example.com') do |user|
      user.password = 'password123'
      user.username = 'testuser'
    end

    sign_in @user

    admin_user = create(:user, admin: true)
    sign_in admin_user
  end

  describe 'GET #index' do
    it 'indexアクションが成功すること' do
      get aquariums_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(aquarium.name)
    end
  end

  describe 'GET #show' do
    it 'showアクションが成功し、水族館の詳細が表示されること' do
      get aquarium_path(aquarium)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(aquarium.name)
    end

    it '存在しない水族館の場合、リダイレクトされること' do
      get aquarium_path(id: 'non-existent-id')
      expect(response).to redirect_to(aquariums_path)
      expect(flash[:alert]).to eq('Aquarium not found')
    end
  end

  describe 'GET #nearby' do
    it '位置情報が提供されていない場合、リダイレクトされること' do
      get nearby_aquariums_path
      expect(response).to redirect_to(aquariums_path)
      expect(flash[:alert]).to eq('位置情報が提供されていません。')
    end

    it '位置情報が提供されている場合、成功すること' do
      get nearby_aquariums_path, params: { lat: 35.6895, lng: 139.6917 } # 正しいパラメータを渡す
      expect(response).to have_http_status(:success)
    end
  end
end
