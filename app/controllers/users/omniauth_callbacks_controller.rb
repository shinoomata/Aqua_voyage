# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  def google_oauth2
    callback_from(:google_oauth2)
  end

  def callback_from(provider)
    provider = provider.to_s
    @user = User.find_or_create_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
