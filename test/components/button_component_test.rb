# frozen_string_literal: true

require 'test_helper'

class ButtonComponentTest < ViewComponent::TestCase
  def test_render_component
    render_inline(ButtonComponent.new('home', '#'))

    assert_selector 'span', text: 'home'
  end
end
