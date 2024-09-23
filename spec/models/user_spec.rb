require 'rails_helper'

RSpec.describe User, type: :model do
  describe "アソシエーション" do
    it { should have_many(:reviews).dependent(:destroy) }
    it { should have_many(:like_aquaria).class_name('LikeAquarium').dependent(:destroy) }
    it { should have_many(:liked_aquariums).through(:like_aquaria).source(:aquarium) }
  end

  describe "メソッド" do
    describe ".find_or_create_for_oauth" do
      let(:auth) do
        OmniAuth::AuthHash.new(
          provider: 'google_oauth2',
          uid: '123456789',
          info: {
            email: 'test@example.com',
            name: 'Test User',
            image: 'http://example.com/image.jpg'
          }
        )
      end

      it "OAuthで新しいユーザーを作成する" do
        user = User.find_or_create_for_oauth(auth)
        expect(user).to be_persisted
        expect(user.email).to eq('test@example.com')
        expect(user.name).to eq('Test User')
        expect(user.provider).to eq('google_oauth2')
        expect(user.uid).to eq('123456789')
      end

      it "既存のユーザーを返す" do
        existing_user = User.find_or_create_by(email: 'test@example.com') do |user|
          user.password = 'password123'
        end
        expect(existing_user.email).to eq('test@example.com')

        # OAuth認証を用いてユーザーを取得し、既存のユーザーが返されるか確認
        user = User.find_or_create_for_oauth(auth)
        expect(user.email).to eq('test@example.com')
      end
    end

    describe "#admin?" do
      it "ユーザーが管理者である場合にtrueを返す" do
        admin_user = User.new(admin: true)
        expect(admin_user.admin?).to be true
      end

      it "ユーザーが管理者でない場合にfalseを返す" do
        regular_user = User.new(admin: false)
        expect(regular_user.admin?).to be false
      end
    end
  end
end
