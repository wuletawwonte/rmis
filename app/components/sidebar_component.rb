# frozen_string_literal: true

class SidebarComponent < ApplicationViewComponent

    param :title
    renders_many :menus, SidebarMenuComponent

end
