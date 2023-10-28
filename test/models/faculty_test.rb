# frozen_string_literal: true

# == Schema Information
#
# Table name: faculties
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_faculties_on_name  (name) UNIQUE
#
require "test_helper"

class FacultyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
