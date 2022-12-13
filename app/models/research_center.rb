# == Schema Information
#
# Table name: research_centers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ResearchCenter < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user

  validates :name, presence: true
end
