# frozen_string_literal: true

class ApplicationViewComponent < ViewComponent::Base
  extend Dry::Initializer

  def resolve_url(url)
    return unless url

    url.is_a?(String) ? url : url_for(url)
  end
end
