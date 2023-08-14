# frozen_string_literal: true

module SettingsHelper
  def provider_icon_class(provider)
    icons = {
      'developer' => 'fas fa-wrench',
      'google_oauth2' => 'fab fa-google',
      'facebook' => 'fab fa-facebook',
      'twitter' => 'fab fa-twitter',
      'github' => 'fab fa-github',
    }

    icons.dig(provider) || 'fas fa-user'
  end
end
