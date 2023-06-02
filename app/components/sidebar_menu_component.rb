# frozen_string_literal: true

class SidebarMenuComponent < ApplicationViewComponent

    param :title
    param :route_path
    param :icon_name
    option :check_parent, default: proc { false }


    def is_current_page?
        return current_page?(route_path) if check_parent == false
        
        request.fullpath.start_with?(route_path)
    end

end
