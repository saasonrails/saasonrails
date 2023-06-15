# frozen_string_literal: true

require "test_helper"

class Layout::PageHeader::ComponentTest < ViewComponent::TestCase
  def test_render
    component = build_component(title: "Test Title", subtitle: "Test Subtitle")

    render_inline(component)

    assert_selector("header > h1", text: "Test Title")
    assert_selector("header > p", text: "Test Subtitle")
  end

  private
    def build_component(**options)
      Layout::PageHeader::Component.new(**options)
    end
end
