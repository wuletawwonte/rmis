class Call < ApplicationRecord
  belongs_to :user
  paginates_per 1

  validates :title, :deadline, presence: true
end
