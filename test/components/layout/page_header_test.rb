# frozen_string_literal: true

require "test_helper"

class Layout::PageHeader::ComponentTest < ActiveSupport::TestCase
  include ViewComponent::TestHelpers

  def test_renders
    component = build_component

    render_inline(component)

    assert_selector("div.page-header")
  end

  private
    def build_component(**options)
      Layout::PageHeader::Component.new(**options)
    end
end
