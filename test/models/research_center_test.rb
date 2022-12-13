# == Schema Information
#
# Table name: research_centers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           default(14), not null
#
# Indexes
#
#  index_research_centers_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class ResearchCenterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
