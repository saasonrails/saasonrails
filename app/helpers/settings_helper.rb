# frozen_string_literal: true

module SettingsHelper
  def provider_icon_class(provider)
    icons = {
      'developer' => 'fas fa-wrench',
      'google_oauth2' => 'fab fa-google',
      'facebook' => 'fab fa-facebook',
      'twitter' => 'fab fa-twitter',
      'github' => 'fab fa-github',
    }

    icons.dig(provider) || 'fas fa-user'
  end

    def placeholder_table_row(colspan)
    content_tag(:tr) do
      content_tag(:th, class: "mini") do
        content_tag(:i, "", class: "fa fa-circle text-neutral-300 animate-pulse text-xs")
      end +
      content_tag(:td, "", colspan: colspan) do
        content_tag(:span, "", class: "content-placeholder")
      end
    end
  end
end
