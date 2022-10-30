class Call < ApplicationRecord
  belongs_to :user
  paginates_per 2

  validates :title, :deadline, presence: true
end
