# == Schema Information
#
# Table name: profiles
#
#  id               :bigint           not null, primary key
#  phone_number     :string
#  id_number        :string
#  academic_rank_id :bigint
#  about            :text
#  prefix           :string
#  faculty_id       :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
