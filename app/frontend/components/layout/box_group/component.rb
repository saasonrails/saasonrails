# frozen_string_literal: true

class Layout::BoxGroup::Component < ApplicationViewComponent
  # with_collection_parameter :box_group
  option :title
  option :html, optional: true, default: proc { {} }
end
