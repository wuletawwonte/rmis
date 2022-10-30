class Call < ApplicationRecord
  belongs_to :user
  paginates_per 5

  validates :title, :deadline, presence: true
end
