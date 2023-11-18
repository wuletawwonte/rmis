# == Schema Information
#
# Table name: system_modules
#
#  id          :bigint           not null, primary key
#  description :text
#  enabled     :boolean          default(FALSE)
#  key         :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_system_modules_on_key  (key) UNIQUE
#
require "test_helper"

class SystemModuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
