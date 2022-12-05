module UsersHelper
  def avatar_for(user, size: 24, extra_class: '')
    if user.avatar.attached?
      content_tag(:div, image_tag(user.avatar, alt: user.full_name, class: "rounded-full object-cover w-#{size} h-#{size}"),
                  class: "flex items-center justify-center rounded-full bg-clip-content box-border border-2 p-1 border-#{user.color}-600 #{extra_class}")
    else
      content_tag(:div, content_tag(:span, user.initials, class: 'font-medium text-gray-700'),
                  class: "flex justify-center inline-flex overflow-hidden relative justify-center items-center bg-slate-200 rounded-full
                    bg-clip-content box-content w-#{size} h-#{size} border-2 p-1 border-#{user.color}-600 #{extra_class}")
    end
  end
end
