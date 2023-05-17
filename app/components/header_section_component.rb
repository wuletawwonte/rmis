class HeaderSectionComponent < ViewComponent::Base
  # validates :title, presence: true

  def initialize(title:, &block)
    super
    @title = title
    @block = block
  end
end
