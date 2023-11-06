# frozen_string_literal: true

module ApplicationHelper
  def menu_title(title)
    content_tag(:h3, title.upcase, class: "mb-4 ml-4 text-sm font-medium text-bodydark2")
  end
end
