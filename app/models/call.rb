# == Schema Information
#
# Table name: calls
#
#  id         :bigint           not null, primary key
#  title      :string
#  published  :boolean
#  deadline   :date
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  code       :string
#
class Call < ApplicationRecord
  before_create :add_code
  belongs_to :user
  has_rich_text :content
  has_many :proposals

  validates :title, :deadline, presence: true

  private

  def add_code
    self.code = "#{SecureRandom.hex(4)}-#{DateTime.now.year}"
  end
end
