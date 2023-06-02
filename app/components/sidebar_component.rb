class SidebarComponent < ApplicationViewComponent
  param :title
  renders_many :menus, SidebarMenuComponent
  renders_one :action_button, ButtonComponent
end
