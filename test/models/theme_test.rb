# frozen_string_literal: true

# == Schema Information
#
# Table name: themes
#
#  id                 :bigint           not null, primary key
#  description        :text
#  title              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  research_center_id :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_themes_on_research_center_id  (research_center_id)
#  index_themes_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (research_center_id => research_centers.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ThemeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
