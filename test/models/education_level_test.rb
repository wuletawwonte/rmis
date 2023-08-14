# frozen_string_literal: true

# == Schema Information
#
# Table name: education_levels
#
#  id         :bigint           not null, primary key
#  name       :string
#  order_key  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_education_levels_on_name  (name) UNIQUE
#
require 'test_helper'

class EducationLevelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
