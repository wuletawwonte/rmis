class Call < ApplicationRecord
  before_create :add_code
  belongs_to :user
  has_rich_text :content

  validates :title, :deadline, presence: true

  private
    def add_code
      self.code = SecureRandom.hex(4)+"-"+DateTime.now.year.to_s
    end
end
