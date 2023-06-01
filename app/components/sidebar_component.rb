# frozen_string_literal: true

class SidebarComponent < ViewComponent::Base

    params :title, default: "AMU-RMIS"
    renders_many :menus, SidebarMenuComponent

end
