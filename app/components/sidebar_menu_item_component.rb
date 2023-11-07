# frozen_string_literal: true

class SidebarMenuItemComponent < ApplicationViewComponent
  param :title
  param :route_path, optional: true
  param :icon_name, optional: true
  option :active, default: proc { false }
  option :auth_check, default: proc { true } # If present, the button will be visible only if the user has the required permissions

  renders_many :submenus

  def render?
    auth_check
  end
end
