# frozen_string_literal: true

require "devise"
require "simple_form"

require "omniauth"
require "omniauth/rails_csrf_protection"

require "dry-initializer"

require "view_component"
require "view_component-contrib"

require "saasonrails/version"
require "saasonrails/engine"

module Saasonrails
  module Controllers
    autoload :Application, "saasonrails/controllers/application"
    autoload :Secure, "saasonrails/controllers/secure"
    autoload :OmniauthCallbacks, "saasonrails/controllers/OmniauthCallbacks"

    module Onboarding
      autoload :PersonalAccounts, "saasonrails/controllers/onboarding/personal_accounts"
    end
  end

  module Teamable
    autoload :CurrentAccountHelper, "saasonrails/teamable/current_account_helper"
    autoload :Current, "saasonrails/teamable/current"
    autoload :MissingAccountError, "saasonrails/teamable/missing_account_error"
  end

  module Models
    autoload :Account, "saasonrails/models/account"
    autoload :AccountUser, "saasonrails/models/account_user"
    autoload :User, "saasonrails/models/user"
    autoload :OauthExternalLogin, "saasonrails/models/oauth_external_login"
  end
end
