# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id          :bigint           not null, primary key
#  role        :integer          default("co_investigator")
#  status      :integer          default("joined")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  proposal_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_members_on_proposal_id  (proposal_id)
#  index_members_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposal_id => proposals.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
