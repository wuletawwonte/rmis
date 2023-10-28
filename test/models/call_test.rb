# frozen_string_literal: true

# == Schema Information
#
# Table name: calls
#
#  id         :bigint           not null, primary key
#  code       :string
#  deadline   :date
#  published  :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_calls_on_code     (code) UNIQUE
#  index_calls_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class CallTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
