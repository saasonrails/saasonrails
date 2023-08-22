# frozen_string_literal: true

require "acts_as_tenant"
require "devise"
require "simple_form"
require "dry-initializer"
require "importmap-rails"
require "public_uid"
require "friendly_id"
require "loaf"
require "meta-tags"
require "ancestry"
require "acts_as_list"
require "omniauth"
require "omniauth/rails_csrf_protection"
require "view_component"
require "view_component-contrib"
require "saasonrails/version"
require "saasonrails/engine"
require "str_enum"

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
    autoload :MissingAccountError, "saasonrails/teamable/missing_account_error"
  end

  module Models
    autoload :Account, "saasonrails/models/account"
    autoload :AccountUser, "saasonrails/models/account_user"
    autoload :User, "saasonrails/models/user"
    autoload :OauthExternalLogin, "saasonrails/models/oauth_external_login"
  end
end
