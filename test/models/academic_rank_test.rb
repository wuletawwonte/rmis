# == Schema Information
#
# Table name: academic_ranks
#
#  id         :bigint           not null, primary key
#  name       :string
#  order_key  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_academic_ranks_on_name  (name) UNIQUE
#
require 'test_helper'

class AcademicRankTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
