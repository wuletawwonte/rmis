# == Schema Information
#
# Table name: global_settings
#
#  id                      :bigint           not null, primary key
#  allowed_co_per_year     :integer
#  allowed_pi_per_year     :integer
#  date_format             :string
#  default_password        :string
#  minimum_password_length :integer
#  university_city         :string
#  university_country      :string
#  university_email        :string
#  university_facebook     :string
#  university_name         :string
#  university_phone        :string
#  university_telegram     :string
#  university_twitter      :string
#  university_website      :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
require 'test_helper'

class GlobalSettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
