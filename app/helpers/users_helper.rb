module UsersHelper
  def avatar_for(user, size: 24 )
    if user.avatar.attached?
      content_tag(:div, image_tag(user.avatar, alt: user.full_name, class: "w-#{size} h-#{size} rounded-full"), class: "image overflow-hidden flex justify-center")
    else
      link_to user_path(user), class: "flex items-center text-sm gap-2  justify-center" do 
        content_tag(:div, content_tag(:span, user.initials, class: "font-medium text-gray-700"), class: "inline-flex overflow-hidden relative justify-center items-center bg-slate-200 rounded-full bg-clip-content box-content w-#{size} h-#{size} border-2 p-1 border-#{user.color}-600")        
      end
    end
  end
end
