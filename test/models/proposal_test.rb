# frozen_string_literal: true

# == Schema Information
#
# Table name: proposals
#
#  id               :bigint           not null, primary key
#  abstract         :text
#  attachement      :string
#  budget           :integer
#  code             :string
#  status           :integer          default("initialized")
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  call_id          :bigint
#  research_type_id :bigint           not null
#  theme_id         :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_proposals_on_call_id           (call_id)
#  index_proposals_on_code              (code) UNIQUE
#  index_proposals_on_research_type_id  (research_type_id)
#  index_proposals_on_theme_id          (theme_id)
#  index_proposals_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (call_id => calls.id)
#  fk_rails_...  (research_type_id => research_types.id)
#  fk_rails_...  (theme_id => themes.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ProposalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
