module MembersHelper
  def member_status_for(member)
    if member.status == "envited"
      content_tag(:span, member.status, class: "px-3 mt-2 py-1 font-semibold leading-tight text-black-700 bg-blue-100 rounded-full")
    elsif member.status == "joined"
      content_tag(:span, member.status, class: "px-3 mt-2 py-1 font-semibold leading-tight text-white bg-purple-600 rounded-full")
    else
      content_tag(:span, "unkown", class: "px-3 mt-2 py-1 font-semibold leading-tight text-black-700 bg-gray-100 rounded-full")
    end
  end

end
