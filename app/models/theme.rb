class Theme < ApplicationRecord
  validates :title, presence: true
  has_many :proposals

  belongs_to :research_center
  belongs_to :user
end
