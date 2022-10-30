class Call < ApplicationRecord
  belongs_to :user

  validates :title, :deadline, presence: true
end
