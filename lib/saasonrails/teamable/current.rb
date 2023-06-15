# frozen_string_literal: true

module Saasonrails
  module Teamable
    class Current < ActiveSupport::CurrentAttributes
      attribute :account
    end
  end
end
