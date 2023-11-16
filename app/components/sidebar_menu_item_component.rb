# frozen_string_literal: true

class SidebarMenuItemComponent < ApplicationViewComponent
  param :title
  option :to, optional: true
  option :icon_name, optional: true
  option :active, optional: true, default: false
  option :auth_check, default: proc {
                                 true
                               } # If present, the button will be visible only if the user has the required permissions

  def render?
    auth_check
  end
end
