# == Schema Information
#
# Table name: themes
#
#  id                 :bigint           not null, primary key
#  research_center_id :bigint           not null
#  user_id            :bigint           not null
#  title              :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Theme < ApplicationRecord
  validates :title, presence: true
  has_many :proposals

  belongs_to :research_center
  belongs_to :user
end
