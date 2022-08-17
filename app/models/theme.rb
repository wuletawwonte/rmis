class Theme < ApplicationRecord
  validates :title, presence: true

  belongs_to :research_center
  belongs_to :user

end
