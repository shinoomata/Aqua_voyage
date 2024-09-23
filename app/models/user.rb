class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :like_aquaria, class_name: 'LikeAquarium', dependent: :destroy
  has_many :liked_aquariums, through: :like_aquaria, source: :aquarium
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.find_or_create_for_oauth(auth)
    find_or_initialize_by(email: auth.info.email).tap do |user|
      user.password = Devise.friendly_token[0, 20] if user.new_record?
      user.name = auth.info.name
      user.image = auth.info.image
      user.provider = auth.provider
      user.uid = auth.uid
      user.save!
    end
  end

  def admin?
    admin
  end
end
