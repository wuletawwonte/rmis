class HeaderSectionComponent < ViewComponent::Base
  # validates :title, presence: true

  def initialize(title: nil, &block)
    @title = title
    @block = block
  end
end
