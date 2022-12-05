# == Schema Information
#
# Table name: members
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  proposal_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  role        :integer          default("co_investigator")
#  status      :integer          default("joined")
#
require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
