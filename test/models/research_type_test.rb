# frozen_string_literal: true

# == Schema Information
#
# Table name: research_types
#
#  id                 :bigint           not null, primary key
#  call_based         :boolean
#  fund_source        :integer          default("internal")
#  gender             :integer          default("male_and_female")
#  max_budget         :integer
#  max_duration       :integer
#  min_researcher     :integer
#  name               :string
#  possible_extension :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_research_types_on_name  (name) UNIQUE
#
require 'test_helper'

class ResearchTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
