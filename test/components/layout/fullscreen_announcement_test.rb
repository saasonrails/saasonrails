# frozen_string_literal: true

require "test_helper"

class Layout::FullscreenAnnouncement::ComponentTest < ViewComponent::TestCase
  def test_render
    component = build_component(title: "Test Title", paragraph: "Lorem ipsum dolor sit amet", image: "https://via.placeholder.com/150")

    render_inline(component)

    assert_selector("header h1", text: "Test Title")
    assert_selector("header p", text: "Lorem ipsum dolor sit amet")
    assert_selector("img[src='https://via.placeholder.com/150']")
  end

  private
    def build_component(**options)
      Layout::FullscreenAnnouncement::Component.new(**options)
    end
end
