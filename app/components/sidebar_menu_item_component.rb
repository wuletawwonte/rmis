# frozen_string_literal: true

class SidebarMenuItemComponent < ApplicationViewComponent
  param :title
  option :to, optional: true
  option :icon_name, optional: true
  option :active, default: proc { false }
  option :auth_check, default: proc { true } # If present, the button will be visible only if the user has the required permissions

  renders_many :submenus, SidebarSubmenuItemComponent

  def render?
    auth_check
  end

  def target_path
    submenus.present? ? "#" : to
  end

  def active_conditionals
    return "" if submenus.blank?

    conditionals = []
    submenus.each do |submenu|
      conditionals.push("page === '#{submenu.title.underscore.camelize(:lower)}'")
    end
    ["|| (", conditionals.join(" || "), ")"].join
  end

  def prevent_default_action
    # This is not safe but used here only temporarly. I suggest adding
    # support for stimulus controller with each view component
    "@click.prevent=\"selected = (selected === '#{title}' ? '' : '#{title}')\""
  end
end
