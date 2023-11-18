# == Schema Information
#
# Table name: system_modules
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  status      :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class SystemModuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
