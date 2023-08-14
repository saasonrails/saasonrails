# frozen_string_literal: true

module Settings
  class OauthExternalLoginsController < SettingsController
    def index
      breadcrumb 'Connected accounts', :settings_oauth_external_logins_path
      @connected_accounts = current_user.external_logins
    end
  end
end