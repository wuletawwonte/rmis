# == Schema Information
#
# Table name: themes
#
#  id                 :bigint           not null, primary key
#  research_center_id :bigint           not null
#  user_id            :bigint           not null
#  title              :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'test_helper'

class ThemeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
