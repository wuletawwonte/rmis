# frozen_string_literal: true

class SidebarMenuComponent < ApplicationViewComponent
  param :title
  param :route_path
  param :icon_name
  option :active, default: proc { false }
  option :auth_check, optional: true # If present, the button will be visible only if the user has the required permissions

  def render?
    return true if auth_check.nil?

    auth_check
  end
end
