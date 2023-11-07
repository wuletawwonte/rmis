# frozen_string_literal: true

class SidebarMenuItemComponent < ApplicationViewComponent
  param :title
  option :to, optional: true
  option :icon_name, optional: true
  option :active, default: proc { false }
  option :auth_check, default: proc { true } # If present, the button will be visible only if the user has the required permissions

  renders_many :submenus, SidebarMenuItemComponent

  def render?
    auth_check
  end

  def target_path
    submenus.present? ? "#" : to
  end

  def active_conditionals
    return "" if submenus.blank?

    result = ["|| ("]
    conditionals = []
    submenus.each do |submenu|
      conditionals.push("page === '#{submenu.title.underscore.camelize(:lower)}'")
    end
    result.push(conditionals.join(" || "), ") }")
    result.join
  end
end
