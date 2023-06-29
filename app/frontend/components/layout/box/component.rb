# frozen_string_literal: true

class Layout::Box::Component < ApplicationViewComponent
  # with_collection_parameter :box
  option :html, optional: true, default: proc { {} }
end
