# == Schema Information
#
# Table name: research_types
#
#  id                 :bigint           not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  call_based         :boolean
#  max_budget         :integer
#  gender             :integer          default("male_and_female")
#  fund_source        :integer          default("internal")
#  min_researcher     :integer
#  max_duration       :integer
#  possible_extension :integer
#
require 'test_helper'

class ResearchTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
