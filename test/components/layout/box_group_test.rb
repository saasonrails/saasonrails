# frozen_string_literal: true

require "test_helper"

class Layout::BoxGroup::ComponentTest < ViewComponent::TestCase
  def test_render
    component = build_component

    render_inline(component)

    assert_selector "div"
  end

  private

  def build_component(**options)
    Layout::BoxGroup::Component.new(**options)
  end
end
