# == Schema Information
#
# Table name: themes
#
#  id                 :bigint           not null, primary key
#  description        :text
#  title              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  research_center_id :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_themes_on_research_center_id  (research_center_id)
#  index_themes_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (research_center_id => research_centers.id)
#  fk_rails_...  (user_id => users.id)
#
class Theme < ApplicationRecord
  validates :title, presence: true
  has_many :proposals

  belongs_to :research_center
  belongs_to :user
end
