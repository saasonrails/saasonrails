# frozen_string_literal: true

module Saasonrails
  module Controllers
    module Application
      extend ActiveSupport::Concern

      include Saasonrails::Teamable::CurrentAccountHelper
      include Saasonrails::Controllers::Secure
    end
  end
end
