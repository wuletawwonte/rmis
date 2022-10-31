class Call < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :title, :deadline, presence: true
end
