# frozen_string_literal: true

module ProposalsHelper
  def status_for(proposal)
    case proposal.status
    when "initialized"
      content_tag(:span, proposal.status,
        class: "px-3 mt-2 py-1 font-semibold leading-tight text-black-700 bg-green-100 rounded-full")
    when "submited"
      content_tag(:span, proposal.status,
        class: "px-3 mt-2 py-1 font-semibold leading-tight text-black-700 bg-orange-100 rounded-full")
    when "accepted"
      content_tag(:span, proposal.status,
        class: "px-3 mt-2 py-1 font-semibold leading-tight text-black-700 bg-blue-100 rounded-full")
    else
      content_tag(:span, "unkown",
        class: "px-3 mt-2 py-1 font-semibold leading-tight text-black-700 bg-orange-100 rounded-full")
    end
  end
end
