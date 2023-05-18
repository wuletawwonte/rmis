class HeaderSectionComponent < ApplicationViewComponent

  option :title, optional: true
  option :block, optional: true

  def initialize()
    super()
  end
end
