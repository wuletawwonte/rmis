# == Schema Information
#
# Table name: documents
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  user_id     :bigint           not null
#  attachement :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
