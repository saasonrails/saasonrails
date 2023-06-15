# frozen_string_literal: true

module Saasonrails
  module Models
    module Account
      extend ActiveSupport::Concern

      included do
        validates :name, presence: true
      end
    end
  end
end
