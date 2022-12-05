# == Schema Information
#
# Table name: education_levels
#
#  id         :bigint           not null, primary key
#  name       :string
#  order_key  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EducationLevel < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
