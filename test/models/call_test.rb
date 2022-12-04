# == Schema Information
#
# Table name: calls
#
#  id         :bigint           not null, primary key
#  title      :string
#  published  :boolean
#  deadline   :date
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  code       :string
#
require 'test_helper'

class CallTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
