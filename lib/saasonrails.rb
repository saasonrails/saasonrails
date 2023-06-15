# frozen_string_literal: true

require "devise"
require "simple_form"

require "omniauth"
require "omniauth/rails_csrf_protection"

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

    module Teamable
      autoload :CurrentAccountHelper, "saasonrails/controllers/teamable/current_account_helper"
      autoload :Current, "saasonrails/controllers/teamable/current"
      autoload :MissingAccountError, "saasonrails/controllers/teamable/missing_account_error"
    end

    module Models
      autoload :User, "saasonrails/models/user"
    end
  end
end
