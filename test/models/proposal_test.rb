# == Schema Information
#
# Table name: proposals
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  title            :string
#  attachement      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  abstract         :text
#  research_type_id :bigint           not null
#  call_id          :bigint
#  status           :integer          default("initialized")
#  budget           :integer
#  theme_id         :bigint           not null
#
require 'test_helper'

class ProposalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
