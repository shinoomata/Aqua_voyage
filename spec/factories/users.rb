FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
    provider { "google_oauth2" }
    uid { "1234567890" }
    username { "testuser" }

    trait :devise_user do
      provider { nil }
      uid { nil }
    end

    trait :google_user do
      provider { "google_oauth2" }
      uid { "123456789" }
      oauth_token { "mock_oauth_token" }
      oauth_expires_at { 1.week.from_now }
    end
  end
end
