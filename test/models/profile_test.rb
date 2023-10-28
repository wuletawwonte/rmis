# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id               :bigint           not null, primary key
#  about            :text
#  id_number        :string
#  phone_number     :string
#  prefix           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  academic_rank_id :bigint
#  faculty_id       :bigint
#
# Indexes
#
#  index_profiles_on_academic_rank_id  (academic_rank_id)
#  index_profiles_on_faculty_id        (faculty_id)
#
# Foreign Keys
#
#  fk_rails_...  (academic_rank_id => academic_ranks.id)
#  fk_rails_...  (faculty_id => faculties.id)
#
require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
